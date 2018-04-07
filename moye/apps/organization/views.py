# _*_ encoding:utf-8 _*_
from django.shortcuts import render
from django.http import HttpResponse
from django.db.models import Q
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


from .models import *
from courses.models import Couse
from .forms import *
from operation.models import UserFavorite
# Create your views here.
def org_list(request):
    if request.method=="GET":
        all_city = CityDict.objects.all()#城市
        all_org = CourseOrg.objects.all()#机构
        hot_orgs = all_org.order_by("-click_nums")[:3]#机构热门榜
        search_keywords = request.GET.get("keywords", "")
        if search_keywords:
            all_org = CourseOrg.objects.filter(
                Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords))
        # course = Couse.objects.first()
        # print(all_org[0].couse_set.all())
        # print(course.courseorg_id)
        for org in all_org:
            course_num = org.couse_set.count()
            org.course_num = course_num
            org.save()

        category = request.GET.get("ct","")

        city_id = request.GET.get("city","")
        if city_id:
            all_org = all_org.filter(city_id=int(city_id))
        if category:
            all_org = all_org.filter(catgory=category)

        sort = request.GET.get("sort","")
        if sort == "students":
            all_org = all_org.order_by("-students")
        else:
            all_org = all_org.order_by("-course_num")
        org_num = all_org.count()

        #分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # Provide Paginator with the request object for complete querystring generation

        p = Paginator(all_org,8, request=request)

        all_org = p.page(page)
        return render(request,'org-list.html',{"all_city":all_city,
                                               "all_org": all_org,
                                               "org_num":org_num,
                                               "city_id":city_id,
                                               "category":category,
                                               "hot_orgs":hot_orgs,
                                               "sort":sort,
                                               })


def add_ask(request):
    '''用户添加咨询'''
    if request.method == "POST":
        user_askfrom = UserAskForm(request.POST)
        if user_askfrom.is_valid():
            user_askform_status=user_askfrom.save(commit=True)
            return HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":"添加错误"}',content_type='application/json')

def org_home(request,org_id):
    '''机构首页'''
    if request.method == "GET":
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_nums+=1
        course_org.save()
        all_courses = course_org.couse_set.all()[:3]
        all_techers = course_org.techer_set.all()[:2]
        current_page = "home"
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        return render(request,'org-detail-homepage.html',{'all_courses':all_courses,
                                                          'all_techers':all_techers,
                                                          'course_org':course_org,
                                                          'current_page':current_page,
                                                          'has_fav':has_fav,
                                                          })


def org_course(request,org_id):
    '''机构首页'''
    if request.method == "GET":
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.couse_set.all()
        current_page = "course"
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-course.html', {'all_courses': all_courses,
                                                          'current_page': current_page,
                                                            'course_org': course_org,
                                                          'has_fav':has_fav,
                                                            })

def org_desc(request, org_id):
    '''机构介绍'''
    if request.method == "GET":
        course_org = CourseOrg.objects.get(id=int(org_id))
        current_page = "desc"
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-desc.html', {
                                                          'current_page': current_page,
                                                          'course_org': course_org,
                                                            'has_fav':has_fav,
                                                          })

def org_teacher(request,org_id):
    '''教师详情'''
    if request.method == "GET":
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_techers = course_org.techer_set.all()
        current_page = "teacher"
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-teachers.html', {'all_teachers': all_techers,
                                                          'current_page': current_page,
                                                            'course_org': course_org,
                                                            'has_fav':has_fav,
                                                            })

def add_fan(request):
    '''用户收藏'''
    if request.method == 'POST':
        fav_id = request.POST.get("fav_id",0)
        fav_type = request.POST.get("fav_type",0)
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')
        exist_record = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fav_type=int(fav_type))
        if exist_record:
            exist_record.delete()
            if int(fav_type) ==1:
                course = Couse.objects.get(id=int(fav_id))
                course.fans_num -= 1
                if course.fans_num<0:
                    course.fans_num=0
                course.save()
            elif int(fav_type) ==2:
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fans_num -= 1
                if course_org.fans_num<0:
                    course_org.fans_num=0
                course_org.save()
            elif int(fav_type) ==3:
                techer = Techer.objects.get(id=int(fav_id))
                techer.fans_num -= 1
                if techer.fans_num<0:
                    techer.fans_num=0
                techer.save()
            return HttpResponse('{"status":"success","msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type)>0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()
                if int(fav_type) == 1:
                    course = Couse.objects.get(id=int(fav_id))
                    course.fans_num += 1
                    course.save()
                elif int(fav_type) == 2:
                    course_org = CourseOrg.objects.get(id=int(fav_id))
                    course_org.fans_num += 1

                    course_org.save()
                elif int(fav_type) == 3:
                    techer = Techer.objects.get(id=int(fav_id))
                    techer.fans_num += 1

                    techer.save()
                return HttpResponse('{"status":"success","msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail","msg":"收藏出错"}', content_type='application/json')


def teacher_list(request):
    '''老师列表页'''
    if request.method == "GET":
        teachers=all_techers = Techer.objects.all()
        sort = request.GET.get("sort", "")
        hot_techers = all_techers.order_by("-click_nums")[:3]
        search_keywords = request.GET.get("keywords", "")
        if search_keywords:
            all_techers = Techer.objects.filter(
                Q(name__icontains=search_keywords) |
                Q(work_company__icontains=search_keywords) |
                Q(work_position__icontains=search_keywords))
        if sort == "hot":
            all_techers = all_techers.order_by("-click_nums")


        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # Provide Paginator with the request object for complete querystring generation

        p = Paginator(all_techers,9, request=request)
        print(p)

        all_techers = p.page(page)
        # print(type(all_courses))
        return render(request,"teachers-list.html",{'all_techers':all_techers,
                                                  'sort':sort,
                                                  'hot_techers':hot_techers,
                                                    "teachers":teachers})

def teacher_detail(request,teacher_id):
    if request.method == "GET":
        hot_teachers = Techer.objects.all()[:3]
        teacher = Techer.objects.get(id=int(teacher_id))
        courses = teacher.couse_set.all()[:3]
        teacher.click_nums += 1
        teacher.save()

        has_fav_teacher = False
        has_fav_courseorg = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.org.id, fav_type=2):
                has_fav_courseorg = True
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.id, fav_type=3):
                has_fav_teacher = True
        return render(request,"teacher-detail.html",{'teacher':teacher,
                                                     "has_fav_courseorg":has_fav_courseorg,
                                                     "has_fav_teacher":has_fav_teacher,
                                                     "hot_teachers":hot_teachers,
                                                     "courses":courses})


