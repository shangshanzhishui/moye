#_*_ encoding:utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models

from courses.models import Couse
from users.models import UserProfile

# Create your models here.
class UserAsk(models.Model):
    name = models.CharField(max_length=20,verbose_name=u'姓名')
    mobile = models.CharField(max_length=11,verbose_name=u'手机')
    course_name = models.CharField(max_length=50,verbose_name=u'课程名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'课程咨询'
        verbose_name_plural = verbose_name
    def __str__(self):
        return '%s' %self.name

class CourseCommets(models.Model):
    user = models.ForeignKey(UserProfile,verbose_name=u'用户名')
    course = models.ForeignKey(Couse,verbose_name=u'课程')
    comments = models.CharField(max_length=300,verbose_name=u'评论')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'课程评论'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s-%s" %(self.user,self.course)


class UserFavorite(models.Model):
    user = models.ForeignKey(UserProfile,verbose_name=u'用户名')
    fav_id = models.IntegerField(default=0,verbose_name=u'数据id')
    fav_type = models.IntegerField(choices=((1,'课程'),(2,'课程机构'),(3,'教师')),verbose_name=u'收藏类型')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'用户收藏'
        verbose_name_plural = verbose_name

        def __str__(self):
            return "%s" % (self.user)


class UserMessage(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u'接收用户')
    message = models.CharField(max_length=300,verbose_name=u'消息内容')
    has_read = models.BooleanField(default=False,verbose_name=u'是否已读')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'用户消息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s" %(self.user)

class UserCourse(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u'用户名')
    course = models.ForeignKey(Couse, verbose_name=u'课程')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'用户课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s-%s" %(self.user,self.course)
