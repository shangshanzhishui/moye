# _*_ encoding:utf-8 _*_
"""moye URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url,include
from django.contrib import admin
import xadmin
from django.views.generic import TemplateView

from users.views import index
from users.views import active,reset,post_reset
from moye.settings import MEDIA_ROOT#,STATIC_ROOT
from django.views.static import serve

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$',index,name='index'),
    url(r'^users/',include("users.urls",namespace="user")),#users app
    url(r'^captcha/',include("captcha.urls")),
    url(r'^active/(?P<active_code>.*)/$',active),
    url(r'^reset/(?P<reset_code>.*)/$',reset),
    url(r'^post_reset/$',post_reset,name="post_reset"),
    #机构app
    url(r'^organization/', include("organization.urls",namespace="organization")),
    #配置上传文件的处理函数
    url(r'^media/(?P<path>.*)$',serve,{"document_root":MEDIA_ROOT}),

    # url(r'^static/(?P<path>.*)$',serve,{"document_root":STATIC_ROOT}),

    #课程相关
    url(r'^course/', include("courses.urls",namespace="course")),

]
#全局404配置
handler404 = "users.views.page_not_find"
handler500 = "users.views.page_error"