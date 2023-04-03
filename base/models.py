from django.db import models
import datetime

class record(models.Model):
    stock = models.IntegerField(default=0)
    dosage = models.IntegerField()
    timeSlot_1 = models.TimeField(default='09:00:00')
    timeSlot_2 = models.TimeField(default='12:00:00')
    timeSlot_3 = models.TimeField(default='18:00:00')
    notification_status = models.IntegerField(default=0)
    notification_volume = models.IntegerField(default=0)
    notification_remind = models.IntegerField(default=0)
    notification_repeat = models.IntegerField(default=0)
    return_status = models.IntegerField(default=0)
    return_date = models.DateField(default=datetime.date.today)
    return_left = models.IntegerField(default=0)
    return_repeat = models.IntegerField(default=0)


class user(models.Model):
    username = models.CharField(max_length=50, default='')
    first_name = models.CharField(max_length=50, default='')
    last_name = models.CharField(max_length=50, default='')
    email = models.CharField(max_length=100, default='')

class drug(models.Model):
    name = models.CharField(max_length=50)
    hospitalDeapartment = models.CharField(max_length=50, default='')
    hospitalName = models.CharField(max_length=50, default='')
    appearance = models.CharField(max_length=100)
    indications = models.CharField(max_length=50)
    sideEffect = models.CharField(max_length=100)
    record = models.ForeignKey(record, related_name="drugs", on_delete=models.DO_NOTHING,default=1)


class interactingDrugs(models.Model):
    level = models.CharField(max_length=20)
    cause = models.CharField(max_length=100,null=True)
    record = models.ForeignKey(record, related_name="interactingDrugs", on_delete=models.DO_NOTHING,default=1)

class SocialAccount(models.Model):
    provider = models.CharField(max_length=200, default='google') # 若未來新增其他的登入方式,如Facebook,GitHub...
    unique_id = models.CharField(max_length=200)
    user = models.ForeignKey(user, related_name='social', on_delete=models.CASCADE)
