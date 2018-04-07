#_*_ encoding:utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models



# Create your models here.
class CityDict(models.Model):
    name = models.CharField(max_length=20,verbose_name=u'城市名')
    desc = models.TextField(verbose_name=u'城市描述')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'城市'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s" %self.name

class CourseOrg(models.Model):
    name = models.CharField(max_length=50,verbose_name=u'机构名称')
    desc = models.TextField(verbose_name=u'机构描述')
    catgory = models.CharField(max_length=20,default='zf',choices=(('zf',"政府"),('zuzhi','组织'),('geren','个人')),verbose_name="类型")
    # classic_course = models.ForeignKey(Couse,null=True,blank=True)
    tag = models.CharField(default=u"志颖最美",max_length=10,verbose_name=u"标签")
    fans_num = models.PositiveIntegerField(default=0, verbose_name=u'收藏人数')
    image = models.ImageField(upload_to="org/%Y/%m", verbose_name=u"封面")
    click_nums = models.PositiveIntegerField(default=0, verbose_name=u"点击数")
    students = models.PositiveIntegerField(default=0, verbose_name=u"学生数")
    course_num = models.PositiveIntegerField(default=0, verbose_name=u"课程数")
    addr = models.CharField(max_length=150,verbose_name=u'机构地址')
    city = models.ForeignKey(CityDict,verbose_name=u'所在城市')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'课程机构'
        verbose_name_plural = verbose_name
    def classic_course(self):
        from courses.models import Couse
        return Couse.objects.filter(courseorg=self,is_classic=True)

    def __str__(self):

        return '%s' %self.name


class Techer(models.Model):
    org = models.ForeignKey(CourseOrg,verbose_name="所在机构")
    name = models.CharField(max_length=50, verbose_name=u'教师名')
    image = models.ImageField(upload_to="teacher/%Y/%m", verbose_name=u"头像",default="")
    work_time = models.PositiveIntegerField(default=0,verbose_name=u'工作时间')
    work_company = models.CharField(max_length=50,verbose_name=u'工作公司')
    work_position = models.CharField(max_length=50,verbose_name=u'职位')
    point = models.CharField(max_length=50, verbose_name=u'教学特点')

    fans_num = models.PositiveIntegerField(default=0, verbose_name=u'收藏人数')
    click_nums = models.PositiveIntegerField(default=0, verbose_name=u"点击数")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u'教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '%s-%s' %(self.name,self.org)