# _*_ encoding:utf-8 _*_
__author__ = 'shangshanzhishui'

import xadmin

from .models import *

class CouseAdmin(object):

    list_display = ['name', 'desc', 'detail', 'degree', 'learn_time', 'students','fans_num','image','click_nums','add_time']
    search_fields = ['name', 'desc', 'detail', 'degree', 'learn_time', 'students','fans_num','image','click_nums']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_time', 'students','fans_num','image','click_nums','add_time']


class LessonAdmin(object):

    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course', 'name', 'add_time']


class VideoAdmin(object):

    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson', 'name', 'add_time']

class CourseResourceAdmin(object):

    list_display = ['course', 'name','download','add_time']
    search_fields = ['course', 'name','download']
    list_filter = ['course', 'name','download','add_time']


xadmin.site.register(Couse,CouseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)


