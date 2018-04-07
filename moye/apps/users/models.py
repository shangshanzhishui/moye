#_*_ encoding:utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=50,verbose_name='昵称',default='')

    birday = models.DateTimeField(verbose_name='生日',null=True,blank=True)
    gender = models.CharField(max_length=50,choices=(('male',u'男'),('female',u'女')),default="female")
    address = models.CharField(max_length=100,default=u"")
    mobile = models.CharField(max_length=11,null=True,blank=True)
    image = models.ImageField(upload_to="image/%Y/%m",default=u"image/default.png",max_length=100)

    class Meta:
        verbose_name= "用户信息"
        verbose_name_plural = verbose_name

    def get_unread_nums(self):
        '''获取用户未读消息数量'''
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self,has_read=False).count()


    def __str__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20,verbose_name=u"验证码")
    email = models.EmailField(max_length=50,verbose_name=u"邮箱")
    send_type = models.CharField(choices=(('register',u'注册'),('forget',u'找回密码')),max_length=30)
    send_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = u'邮箱验证'
        verbose_name_plural = verbose_name
    def __str__(self):
        return "%s(%s)" %(self.code,self.email)

class Banner(models.Model):
    title = models.CharField(max_length=100,verbose_name=u"标题")
    image = models.ImageField(upload_to="banner/%y/%m",verbose_name=u"轮播图")
    url = models.URLField(max_length=200,verbose_name=u"访问地址")
    index = models.IntegerField(default=100,verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name
