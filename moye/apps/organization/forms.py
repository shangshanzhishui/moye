# _*_ encoding:utf-8 _*_
__author__ = 'shangshanzhishui'

from django import forms
import re

from operation.models import UserAsk

class UserAskForm(forms.ModelForm):

    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']

    def clean_mobile(self):
        mobile = self.cleaned_data['mobile']
        right_mobile = "^1[158]\d{9}$|^147\d{8}$|^17[56]\d{8}$|^166\d{8}$|199\d{8}$"
        r=re.compile(right_mobile)
        if r.match(mobile):
            return mobile
        else:
            raise forms.ValidationError(u"手机号码非法",code="mobile_invalid")