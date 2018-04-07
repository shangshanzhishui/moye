# _*_ encoding:utf-8 _*_
from django.shortcuts import render,HttpResponse
from courses.models import Couse
from django.contrib.auth.decorators import login_required
from django.db.models import Q
# Create your views here.

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserFavorite,CourseCommets,UserCourse
from courses.models import CourseOrg,CourseResource

def course_list(request):
    if request.method == "GET":
        all_courses = Couse.objects.all().order_by("-add_time")
        sort = request.GET.get("sort", "")
        search_keywords = request.GET.get("keywords","")
        if search_keywords:
            all_courses = Couse.objects.filter(Q(name__icontains=search_keywords)|Q(desc__icontains=search_keywords)|Q(detail__icontains=search_keywords))
        hot_courses = all_courses.order_by("-click_nums")[:3]
        if sort == "students":
            all_courses = all_courses.order_by("-students")
        elif sort=="hot":
            all_courses = all_courses.order_by("-click_nums")

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # Provide Paginator with the request object for complete querystring generation

        p = Paginator(all_courses,9, request=request)
        print(p)

        all_courses = p.page(page)
        # print(type(all_courses))
        current_page = "course_list"
        return render(request,"course-list.html",{'all_courses':all_courses,
                                                  'sort':sort,
                                                  'course_list':course_list,
                                                  'hot_courses':hot_courses})

def course_detail(request,course_id):
    '''课程详情叶'''
    if request.method == "GET":
        course = Couse.objects.get(id=int(course_id))
        course.click_nums +=1
        course.save()
        tag = course.tag
        if tag:
            relate_course = Couse.objects.filter(tag=tag).exclude(id=course_id)[:1]
        else:
            relate_course = []

        has_fav_course = False
        has_fav_courseorg = False
        if request.user.is_authenticated():
            print(course.courseorg.name)
            if UserFavorite.objects.filter(user=request.user, fav_id=course.courseorg.id, fav_type=2):
                has_fav_courseorg = True
            if UserFavorite.objects.filter(user=request.user,fav_id=course.id,fav_type=1):
                has_fav_course = True

        return render(request,'course-detail.html',{"course":course,
                                                    'relate_course':relate_course,
                                                    'has_fav_courseorg':has_fav_courseorg,
                                                    'has_fav_course':has_fav_course,
                                                    })

def add_fan(request):
    if request.method == 'POST':
        fav_id = request.POST.get("fav_id",0)
        fav_type = request.POST.get("fav_type",0)
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')
        exist_record = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fav_type=int(fav_type))
        if exist_record:
            exist_record.delete()
            return HttpResponse('{"status":"success","msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type)>0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()
                return HttpResponse('{"status":"success","msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail","msg":"收藏出错"}', content_type='application/json')

@login_required(login_url="/users/login/")
def course_info(request,course_id):
    if request.method == "GET":
        # 保存当前用户学习的此课程
        user = request.user#当前用户
        #

        # current_user_course = usercourse.course#当前用户学过的所有课程
        course = Couse.objects.get(id=int(course_id))
        course.students +=1
        course.save()
        usercourse = UserCourse.objects.filter(user=user, course=course)  # 当前用户的学习记录
        if not usercourse:
            usercourse = UserCourse(user=user,course=course)
            usercourse.save()


        course_source = CourseResource.objects.filter(course=course)
        course_lesson = course.get_zj_name()

        #获取学过次课程的同学学得其他课程
        user_courses = UserCourse.objects.filter(course=course)
        #看过次课程的别的用户的id
        id = request.user.id
        user_ids = [user_course.user.id for user_course in user_courses]

        user_ids.remove(id)
        if isinstance(user_ids,int):
            user_ids = [user_ids,]

        all_resources = UserCourse.objects.filter(user_id__in=user_ids)
        #别的课程的id
        others_cousers_ids = [user_course.course.id for user_course in all_resources]
        if int(course.id) in others_cousers_ids:
            others_cousers_ids.remove(int(course_id))
        else:
            others_cousers_ids=[]
        if others_cousers_ids:
            others_cousers = Couse.objects.filter(id__in=others_cousers_ids).order_by("-click_nums")[:5]
        else:
            others_cousers = []
        return render(request,'course-video.html',{"course_lesson":course_lesson,
                                                   "course":course,
                                                   "course_source":course_source,
                                                   'others_cousers':others_cousers,
                                                   })

@login_required(login_url="/users/login/")
def course_comment(request,course_id):
    if request.method == "GET":
        course = Couse.objects.get(id=course_id)
        course_source = CourseResource.objects.filter(course=course)
        course_lesson = course.get_zj_name()
        user_comment = CourseCommets.objects.filter(course=course)

        return render(request, 'course-comment.html', {"course_lesson": course_lesson,
                                                     "course": course,
                                                     "course_source": course_source,
                                                       "user_comment":user_comment,
                                                     })

def add_comment(request):
    if request.method == "POST":
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')
        course_id = request.POST.get("course_id",0)
        comment = request.POST.get("comments","")
        if int(course_id)>0 and course_id:
            user_comment = CourseCommets()
            course = Couse.objects.get(id = course_id)
            user_comment.comments = comment
            user_comment.course = course
            user_comment.user = request.user
            user_comment.save()
            return HttpResponse('{"status":"success","msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":"添加失败"}', content_type='application/json')


# def last(request,course_id):
#     if request.method == "GET":
#         if request.method == "GET":
#             course = Couse.objects.get(id=course_id)
#             course_source = CourseResource.objects.filter(course=course)
#             course_lesson = course.get_zj_name()
#             user_comment = CourseCommets.objects.filter(course=course)
#             for co in user_comment:
#                 print(co.comments)
#             return render(request, 'video.html', {"course_lesson": course_lesson,
#                                                            "course": course,
#                                                            "course_source": course_source,
#                                                            "user_comment": user_comment,
#                                                            })