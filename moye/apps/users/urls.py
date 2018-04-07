# _*_ encoding:utf-8 _*_
__author__ = 'shangshanzhishui'

from django.conf.urls import url,include


from .views import *

from courses import views
urlpatterns = [

    url(r'^login/$',user_login,name='login'),
    url(r'^logout/$',user_logout,name='logout'),
    url(r'^register/$',user_register,name='register'),
    url(r'^forgetpwd/$',user_forgetpwd,name='forgetpwd'),
    url(r'^info/$',user_home,name='user_home'),#用户信息
    url(r'^upload/image/$',upload_image,name='upload_image'),#用户头像修改
    url(r'^update/pwd/$',upload_password,name='upload_password'),#修改用户密码
    url(r'^sendemail_code/$',sendemil_code,name='sendemil_code'),#发送邮箱验证码
    url(r'^update_email/$',update_email,name='update_email'),#修改邮箱验证码
    url(r'^mycourse/$',mycourse,name='mycourse'),#我的课程
    url(r'^myfav/org/$',myfav_org,name='myfav_org'),#我收藏的课程
    url(r'^myfav/teacher/$',myfav_teacher,name='myfav_teacher'),#我收藏的老师
    url(r'^myfav/course/$',myfav_course,name='myfav_course'),#我收藏的课程
    url(r'^message/$',message,name='message'),#我的消息

]

