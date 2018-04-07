# _*_ encoding:utf-8 _*_
__author__ = 'shangshanzhishui'

import xadmin

from .models import *

class CityDictAdmin(object):

    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter =  ['name', 'desc', 'add_time']


class CourseOrgAdmin(object):

    list_display = ['name', 'desc', 'fans_num','image','click_nums','addr','city','add_time']
    search_fields = ['name', 'desc', 'fans_num','image','click_nums','addr','city']
    list_filter = ['name', 'desc', 'fans_num','image','click_nums','addr','city','add_time']
    relfield_style = 'fk-ajax'


class TecherAdmin(object):

    list_display = ['org', 'name', 'work_time', 'work_company', 'work_position', 'point', 'fans_num', 'click_nums','add_time']
    search_fields = 'org', 'name', 'work_time', 'work_company', 'work_position', 'point', 'fans_num', 'click_nums'
    list_filter = ['org', 'name', 'work_time', 'work_company', 'work_position', 'point', 'fans_num', 'click_nums','add_time']


xadmin.site.register(CityDict,CityDictAdmin)
xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(Techer,TecherAdmin)
