# _*_ encoding:utf-8 _*_
__author__ = 'shangshanzhishui'

from django.conf.urls import url


from .views import *

from courses import views
urlpatterns = [

    url(r'^list/$',org_list,name='org_list'),
    url(r'^add_ask/$',add_ask,name='add_ask'),
    url(r'^add_fan/$',add_fan,name='add_fan'),
    url(r'^home/(?P<org_id>\d+)/$',org_home,name='org_home'),
    url(r'^course/(?P<org_id>\d+)/$',org_course,name='org_course'),
    url(r'^desc/(?P<org_id>\d+)/$',org_desc,name='org_desc'),
    url(r'^teacher/(?P<org_id>\d+)/$',org_teacher,name='org_teacher'),
    url(r'^teacher/list/$',teacher_list,name='teacher_list'),
    url(r'^teacher/detail/(?P<teacher_id>\d+)$',teacher_detail,name='teacher_detail'),




]