#_*_ encoding:utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models

from organization.models import CourseOrg,Techer
# Create your models here
class Couse(models.Model):
    courseorg = models.ForeignKey(CourseOrg,verbose_name=u"所属机构",default="")
    name = models.CharField(max_length=50,verbose_name=u'课程名')
    is_banner = models.BooleanField(default=False,verbose_name="是否轮播")
    is_classic = models.BooleanField(default=False,verbose_name="是否经典")

    teacher = models.ForeignKey(Techer,null=True,blank=True,verbose_name="授课老师")
    desc = models.CharField(max_length=300,verbose_name=u'课程描述')
    category = models.CharField(max_length=50,verbose_name=u"课程类别",default="")
    detail = models.TextField(verbose_name=u'课程详情')
    degree = models.CharField(max_length=30,choices=(('cj',u'初级'),('zj',u'中级'),('gj',u'高级')),verbose_name=u"等级")
    learn_time = models.PositiveIntegerField(default=0,verbose_name=u'学习时间')
    students = models.PositiveIntegerField(default=0,verbose_name=u'学习人数')
    fans_num = models.PositiveIntegerField(default=0,verbose_name=u'收藏人数')
    image = models.ImageField(upload_to="course/%Y/%m",verbose_name=u"封面")
    tag = models.CharField(max_length=50,verbose_name=u'课程标签',default="")
    click_nums = models.PositiveIntegerField(default=0,verbose_name=u"点击数")
    course_known = models.CharField(max_length=300,default="",verbose_name=u'课程须知')
    teacher_tell = models.CharField(max_length=300,default="",verbose_name=u'老师告诉你')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")


    class Meta:
        verbose_name = u"课程"
        verbose_name_plural=verbose_name

    def __str__(self):
        return '%s' %(self.name)
    def get_zj_nums(self):
        return self.lesson_set.all().count()
    def get_learn_user(self):
        return self.usercourse_set.all()[:5]
    def get_zj_name(self):
        '''获取章节名'''
        return self.lesson_set.all()

class Lesson(models.Model):
    course = models.ForeignKey(Couse,verbose_name=u"课程")
    name = models.CharField(max_length=100,verbose_name=u"章节名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '%s-%s' %(self.course,self.name)
    def get_video(self):
        return self.video_set.all()


class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name=u"章节")
    name = models.CharField(max_length=100, verbose_name=u"视频名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")
    class Meta:
        verbose_name = u'视频'
        verbose_name_plural = verbose_name
    def __str__(self):
        return "%s,%s" %(self.lesson,self.name)


class CourseResource(models.Model):
    course = models.ForeignKey(Couse, verbose_name=u"课程")
    name = models.CharField(max_length=100, verbose_name=u"名称")
    download = models.FileField(upload_to="course/resource/%Y/%m",verbose_name=u"文件资源",max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '%s' %(self.course)