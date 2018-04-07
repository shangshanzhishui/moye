# _*_ encoding:utf-8 _*_
__author__ = 'shangshanzhishui'

from django.conf.urls import url

from .views import *

urlpatterns = [

    url(r'^list/$',course_list,name='course_list'),
    url(r'^add_fan/$',add_fan,name='add_fan'),
    url(r'^detail/(?P<course_id>\d+)/$',course_detail,name='course_detail'),
    url(r'^info/(?P<course_id>\d+)/$',course_info,name='course_info'),
    # url(r'^video/',last,name="last"),
    url(r'^add_comment/',add_comment,name="add_comment"),
    url(r'^comment/(?P<course_id>\d+)/$',course_comment,name="course_comment"),
    # url(r'^video/(?P<course_id>\d+)/$',last,name="last"),




]