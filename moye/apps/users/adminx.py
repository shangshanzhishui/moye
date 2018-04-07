# _*_ encoding:utf-8 _*_
__author__ = 'shangshanzhishui'

import xadmin
from xadmin import views
from xadmin.plugins.auth import UserAdmin
from .models import *

# class UserProfileAdmin(UserAdmin):
#     pass

class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSetting(object):
    site_title = '木叶网络课堂'
    site_footer = '木叶教育集团'
    menu_style = 'accordion'

class EmailVerifyRecordAdmin(object):
    list_display = ['code','email','send_type','send_time']
    search_fields = ['code','email','send_type']
    list_filter = ['code','email','send_type','send_time']
    model_icon = 'fa fa-address-card'


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index','add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index','add_time']


class UserProfileAdmin(object):

    list_display = ['nick_name', 'birday', 'gender', 'address', 'mobile','is_staff','image']
    search_fields = ['nick_name', 'birday', 'gender', 'address', 'mobile','image']
    list_filter = ['nick_name', 'birday', 'gender', 'address', 'mobile','image']

xadmin.site.register(Banner,BannerAdmin)
# xadmin.site.register(UserProfile,UserProfileAdmin)
xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)
xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSetting)
# xadmin.site.register(views.CommAdminView,GlobalSetting)