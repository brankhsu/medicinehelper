from django.db import models
import datetime

class record(models.Model):
    hospitalDepartment = models.CharField(max_length=50, default='')
    hospitalName = models.CharField(max_length=50, default='')
    hospitalphone = models.CharField(max_length=50, default='')
    hospitalextension = models.CharField(max_length=50, default='')
    stock = models.IntegerField(default=0)
    dosage = models.IntegerField()
    ondemand = models.BooleanField(default=False)
    position = models.IntegerField(default=1)
    frequency = models.IntegerField(default=1)
    timings_1 = models.IntegerField(default=0)
    timings_2 = models.IntegerField(default=0)
    notification_status = models.IntegerField(default=0)
    notification_startDate = models.DateField(default=datetime.date.today)
    notification_remind = models.IntegerField(default=0)
    notification_repeat = models.IntegerField(default=0)
    return_status = models.IntegerField(default=0)
    return_date = models.DateField(default=datetime.date.today)
    return_left = models.IntegerField(default=0)
    return_repeat = models.IntegerField(default=0)

class timeslots(models.Model):
    timeslot = models.TimeField(default='09:00:00')
    rid = models.ForeignKey(record, related_name="timeslots", on_delete=models.DO_NOTHING,default=1)

class timings(models.Model):
    timing = models.IntegerField(default=0)
    rid = models.ForeignKey(record, related_name="timings", on_delete=models.DO_NOTHING,default=1)

class user(models.Model):
    username = models.CharField(max_length=50, default='')
    first_name = models.CharField(max_length=50, default='')
    last_name = models.CharField(max_length=50, default='')
    email = models.CharField(max_length=100, default='')


class drug(models.Model):
    name = models.CharField(max_length=50)
    appearance = models.CharField(max_length=100)
    indications = models.CharField(max_length=50)
    sideEffect = models.CharField(max_length=100)
    rid = models.ForeignKey(record, related_name="drugs", on_delete=models.CASCADE)


class interactingDrugs(models.Model):
    level = models.CharField(max_length=20,default=" ")
    name = models.CharField(max_length=20,default=" ")
    cause = models.CharField(max_length=100,null=True,default=" ")
    rid = models.ForeignKey(record, related_name="interactingDrugs", on_delete=models.CASCADE)

class SocialAccount(models.Model):
    provider = models.CharField(max_length=200, default='google')
    unique_id = models.CharField(max_length=200)
    user = models.ForeignKey(user, related_name='social', on_delete=models.CASCADE)

class reminder(models.Model):
    drug_id = models.IntegerField(default=0)
    drug_name = models.CharField(max_length=20,default=" ")
    timeSlot = models.TimeField(default='09:00:00')
    date = models.DateField(default=datetime.date.today)
    status = models.IntegerField(default=0)
    rid = models.ForeignKey(record, related_name="reminders", on_delete=models.CASCADE)


