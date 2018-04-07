# _*_ encoding:utf-8 _*_
import json

from django.shortcuts import render,HttpResponse,redirect,HttpResponseRedirect,render_to_response
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.contrib.auth.hashers import make_password
from django.contrib.auth.decorators import login_required
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.core.urlresolvers import reverse
# Create your views here.

from .forms import *
from .models import UserProfile,EmailVerifyRecord,Banner
from utils.email_send import send_email_register
from operation.models import UserCourse,UserFavorite,UserMessage
from organization.models import CourseOrg,Techer
from courses.models import Couse


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):

                return user
        except Exception as e:
            return None

def user_login(request):
    if request.method == "POST":

        login_form = loginform(request.POST)
        if login_form.is_valid():

            email=username = request.POST.get("username","")
            password = request.POST.get("password","")

            user = authenticate(username=username,password=password)
            if user:
                if user.is_staff:
                    login(request,user)

                    return HttpResponseRedirect(reverse("index"))
                else:
                    return render(request,'login.html',{"message":"用户未激活"})
            else:
                return render(request,'login.html',{"message":"用户名或者密碼錯誤"})

        else:
            return render(request,'login.html',{"login_form":login_form})
    elif request.method == "GET":
        course_banner = Couse.objects.filter(is_banner=True)[:3]
        return render(request,'login.html',{"course_banner":course_banner})

def user_logout(request):
    if request.method == "GET":
        logout(request)

        return HttpResponseRedirect(reverse("index"))


def user_register(request):
    if request.method == "GET":
        register_form = RegisterForm(request.POST)
        course_banner = Couse.objects.filter(is_banner=True)[:3]
        return render(request,'register.html',{"register_form":register_form,"course_banner":course_banner})
    elif request.method == "POST":
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():

            username = email = request.POST.get("email","")

            password = request.POST.get("password","")
            try:
                user_profile = UserProfile.objects.get(Q(username=username)|Q(email=username))

            except Exception as e:
                user_profile = None
            if user_profile:
                if user_profile.is_active:

                    return render(request,'login.html',{"register_form":register_form,"message":"用戶已存在"})
                else:
                    return render(request, 'login.html', {"message": "用戶已注册，但未激活，请进入邮箱激活","register_form":register_form})

            user_profile = UserProfile()
            user_profile.username = username
            user_profile.is_active = False
            user_profile.email = email
            user_profile.password = make_password(password)
            user_profile.save()
            #添加欢迎信息
            # user_message = UserMessage(user=request.user)
            #
            # user_message.message = "欢迎注册木叶忍术教育,先告诉你一个真理,那就是:志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画"
            # user_message.save()
            send_email_register(email,"register")
            return render(request,"login.html")
            print("fuck you")
        else:
            print("fuck")
            return render(request,"register.html",{"register_form":register_form})

def active(request,active_code):
    if request.method =="GET":
        emil_recode = EmailVerifyRecord.objects.filter(code=active_code)
        if emil_recode:
            for cord in emil_recode:
                email = cord.email

                user = UserProfile.objects.get(email=email)
                user.is_staff = True
                user.save()
            return render(request,'login.html')
        else:
            return render(request,'active_fail.html')

def user_forgetpwd(request):
    if request.method == "GET":
        froget_form = forgetForm()
        return render(request,'forgetpwd.html',{"forget_form":froget_form})
    if request.method =="POST":
        froget_form = forgetForm(request.POST)
        if  froget_form.is_valid():
            email = request.POST.get("email",'')
            send_email_register(email,"forget")
            return render(request,"send_success.html",{"message_email":"邮件发送成功，请注意查收"})
        else:
            return render(request, "send_success.html", {"message_email": "邮件发送失败，请稍后重试"})

def reset(request,reset_code):
    if request.method =="GET":
        emil_recode = EmailVerifyRecord.objects.filter(code=reset_code)
        if emil_recode:
            for cord in emil_recode:
                email = cord.email

                return render(request,"password_reset.html",{"email":email})

        else:
            return render(request,'send_success.html',{"message":"出錯了！！！！！"})

def post_reset(request):
    if request.method== "POST":
        repwd_form = resetpwdForm(request.POST)
        if repwd_form.is_valid():
            password1 = request.POST.get("password1",'')
            password2 = request.POST.get("password2",'')
            email = request.POST.get("email",'')
            if password1 == password2:
                user = UserProfile.objects.get(email=email)
                user.password = make_password(password1)
                user.save()
                return render(request,'login.html')
            else:

                return render(request, "password_reset.html", {"message":"兩次輸入的密碼不一致","email":email})

        return render(request,"password_reset.html",{"repwd_form":repwd_form})

@login_required(login_url="/users/login/")
def user_home(request):
    if request.method == "GET":
        return render(request,"usercenter-info.html")
    if request.method == "POST":
        user = request.user
        user_info_update_form = UserInfoUpdate(request.POST,instance=user)
        if user_info_update_form.is_valid():
            user_info_update_form.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse(json.dumps(user_info_update_form.errors), content_type="application/json")

def upload_image(request):
    '''修改头像'''
    if request.method == "POST":
        uploadfrom = UpLoadImage(request.POST,request.FILES)

        if uploadfrom.is_valid():
            image = uploadfrom.cleaned_data['image']
            request.user.image = image
            request.user.save()

            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse('{"status":"fail"}', content_type="application/json")

def upload_password(request):
    '''个人中心里修改密码'''
    if request.method== "POST":
        repwd_form = resetpwdForm(request.POST)
        if repwd_form.is_valid():
            password1 = request.POST.get("password1",'')
            password2 = request.POST.get("password2",'')

            if password1 == password2:
                user = request.user
                user.password = make_password(password1)
                user.save()
                return HttpResponse('{"status":"success"}', content_type="application/json")
            else:

                return HttpResponse('{"status":"fail","message":"兩次輸入的密碼不一致"}', content_type="application/json")

        return HttpResponse(json.dumps(repwd_form.errors), content_type="application/json")

@login_required(login_url="/users/login/")
def sendemil_code(request):
    '''发送邮箱验证码'''
    if request.method == "GET":

        email = request.GET.get("email","")
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"此邮箱已注册"}',content_type="application/json")
        send_email_register(email,"update_email")
        return HttpResponse('{"status":"success"}', content_type="application/json")

def update_email(request):
    '''修改个人邮箱'''
    if request.method=="POST":
        email = request.POST.get("email","")
        code = request.POST.get("code","")

        #获取验证记录
        recoreded = EmailVerifyRecord.objects.filter(email=email,code=code,send_type="update_email")
        if recoreded:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse('{"email":"验证码出错"}', content_type="application/json")


@login_required(login_url="/users/login/")
def mycourse(request):
    '''我的课程页面'''
    if request.method == "GET":
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request,"usercenter-mycourse.html",{"user_courses":user_courses})

def myfav_org(request):
    if request.method == "GET":
        org_list = []

        user_favs = UserFavorite.objects.filter(user=request.user,fav_type=2)
        current_page = "org"
        for user_fav in user_favs:
            org_id = user_fav.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request,"usercenter-fav-org.html",{"org_list":org_list,"current_page":current_page})

def myfav_teacher(request):
    '''我收藏的老师'''
    if request.method == "GET":
        teacher_list = []

        user_favs = UserFavorite.objects.filter(user=request.user,fav_type=3)
        for user_fav in user_favs:
            teacher_id = user_fav.fav_id
            teacher = Techer.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request,"usercenter-fav-teacher.html",{"teacher_list":teacher_list})


def myfav_course(request):
    '''我收藏的课程'''
    if request.method == "GET":
        course_list = []

        user_favs = UserFavorite.objects.filter(user=request.user,fav_type=1)
        for user_fav in user_favs:
            course_id = user_fav.fav_id
            course = Couse.objects.get(id=course_id)
            course_list.append(course)
        return render(request,"usercenter-fav-course.html",{"course_list":course_list})


def message(request):
    '''我的消息'''
    if request.method == "GET":
        user_messages = UserMessage.objects.filter(user=request.user)
        user_unread_messages = UserMessage.objects.filter(user=request.user,has_read=False)

        for user_unread_message in user_unread_messages:
            user_unread_message.has_read =True
            user_unread_message.save()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # Provide Paginator with the request object for complete querystring generation

        p = Paginator(user_messages,9, request=request)
        print(p)

        user_messages = p.page(page)
        return render(request, "usercenter-message.html", {"user_messages":user_messages})


def index(request):
    '''首页'''
    if request.method == "GET":
        banners = Banner.objects.all().order_by("index")
        courses = Couse.objects.filter(is_banner=False)[:6]
        banner_course = Couse.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all()[:15]

        return render(request,"index.html",{"banners":banners,
                                            "courses":courses,
                                            "banner_course":banner_course,
                                            "course_orgs":course_orgs})
def page_not_find(request):
    response = render_to_response("404.html",{})
    response.status_code = 404
    return response

def page_error(request):
    response = render_to_response("500.html",{})
    response.status_code = 500
    return response