from rest_framework import serializers
from base.models import user,drug,record,interactingDrugs,SocialAccount,timeslots,historyRecord,reminder
from rest_framework import serializers
from django.contrib.auth.models import User
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from google.oauth2 import id_token

from google.auth.transport import requests
from myproject.settings import SOCIAL_GOOGLE_CLIENT_ID


class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = user
        fields = '__all__'

class drugSerializer(serializers.ModelSerializer):
    class Meta:
        model = drug
        fields = '__all__'
        read_only_fields = ('rid',)

class drugnameSerializer(serializers.ModelSerializer):
    class Meta:
        model = drug
        fields = ['id','name']
class interactingDrugsSerializer(serializers.ModelSerializer):
    timeSlots = serializers.SerializerMethodField()

    class Meta:
        model = interactingDrugs
        fields = ['id','level','name','cause','timeSlots']
        read_only_fields = ('rid',)

    def get_timeSlots(self, obj):
        timeslots = obj.rid.timeslots.all().order_by('timeslot')
        return [str(timeslot.timeslot.strftime('%H:%M')) for timeslot in timeslots]
class notificationSerializer(serializers.ModelSerializer):

    class Meta:
        model = record
        fields = ['notification_status', 'notification_startDate', 'notification_remind', 'notification_repeat']


class returnSerializer(serializers.ModelSerializer):
    class Meta:
        model = record
        fields = ['return_status', 'return_date', 'return_left', 'return_repeat']

class hospitalSerializer(serializers.ModelSerializer):
    class Meta:
        model = record
        fields = ['hospitalDepartment', 'hospitalName', 'hospitalphone', 'hospitalextension']
class TimeslotsSerializer(serializers.ModelSerializer):
    class Meta:
        model = timeslots
        fields = ['timeslot']

    def to_representation(self, instance):
        return instance.timeslot.strftime('%H:%M:%S')
class drugPositionSerializer(serializers.ModelSerializer):
    class Meta:
        model = record
        fields = ['id','position']
class historydrugSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField(max_length=50)

class historyRecordSerializer(serializers.ModelSerializer):
    drug = historydrugSerializer()

    def create(self, validated_data):
        drug_data = validated_data.pop('drug')
        drug_id = drug_data['id']
        drug_name = drug_data['name']
        record = historyRecord.objects.create(drug_id=drug_id, drug_name=drug_name, **validated_data)
        return record

    def update(self, instance, validated_data):
        drug_data = validated_data.pop('drug', None)
        if drug_data:
            drug_id = drug_data.get('id')
            drug_name = drug_data.get('name')
            instance.drug_id = drug_id
            instance.drug_name = drug_name
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance

    def delete(self, instance):
        instance.delete()
    class Meta:
        model = historyRecord
        fields = ['id','date','drug','dosage','timeSlot','status']


class recordSerializer(serializers.ModelSerializer):
    drug = serializers.SerializerMethodField()
    hospital = serializers.SerializerMethodField()
    timeslots = serializers.SerializerMethodField()
    timings = serializers.SerializerMethodField()
    interactingDrugs = interactingDrugsSerializer(many=True)
    notificationSetting = notificationSerializer(source='*')
    returnSetting = returnSerializer(source='*')
    class Meta:
        model = record
        fields = ['id','hospital','drug','ondemand','interactingDrugs','dosage','stock','position','frequency','timeslots','timings','notificationSetting','returnSetting']

    def create(self, validated_data):
        drugs_data = validated_data.pop('drugs')
        interacting_drugs_data = validated_data.pop('interactingDrugs')

        r = record.objects.create(**validated_data)
        for data in drugs_data:
            drug.objects.create(rid=r,**data)
        for data in interacting_drugs_data:
            interactingDrugs.objects.create(rid=r,**data)
        return record

    def get_timeslots(self, obj):
        return [ts.timeslot for ts in obj.timeslots.all()]

    def get_timings(self, obj):
        return [ts.timings for ts in obj.timings.all()]

    def get_drug(self, obj):
           drug = obj.drugs.first()
           return drugSerializer(drug).data

    def get_hospital(self, obj):
        return {
            'name': obj.hospitalName,
            'department': obj.hospitalDepartment,
            'phone': obj.hospitalphone,
            'extension': obj.hospitalextension
        }
class reminderSerializer(serializers.ModelSerializer):
    drug = serializers.SerializerMethodField()
    timeSlot = serializers.SerializerMethodField()

    class Meta:
        model = record
        fields = ('id', 'drug', 'timeSlot', 'dosage')

    def get_drug(self, obj):
           drug = obj.drugs.first()
           return drugnameSerializer(drug).data

    def get_timeSlot(self, instance):
        timeslot = instance.timeslots.order_by('timeslot').first()
        if timeslot:
            return timeslot.timeslot
        return None

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['timeSlot'] = representation.pop('timeSlot')
        return representation

class todayreminderSerializer(serializers.ModelSerializer):
    drug = historydrugSerializer()

    def create(self, validated_data):
        drug_data = validated_data.pop('drug')
        drug_id = drug_data['id']
        drug_name = drug_data['name']
        record = reminder.objects.create(drug_id=drug_id, drug_name=drug_name, **validated_data)
        return record

    def update(self, instance, validated_data):
        drug_data = validated_data.pop('drug', None)
        if drug_data:
            drug_id = drug_data.get('id')
            drug_name = drug_data.get('name')
            instance.drug_id = drug_id
            instance.drug_name = drug_name
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance

    def delete(self, instance):
        instance.delete()
    class Meta:
        model = reminder
        fields = ['id','date','drug','timeSlot','dosage','position','stock']


class hospitalDepartmentsSerializer(serializers.ModelSerializer):
    name = serializers.CharField(source='hospitalDepartment')

    class Meta:
        model = record
        fields = ['name']




class SocialLoginSerializer(serializers.Serializer):
    token = serializers.CharField(required=True)

    def verify_token(self, token):
        """
        驗證 id_token 是否正確

        token: JWT
        """
        try:
            idinfo = id_token.verify_oauth2_token(
                token, requests.Request(), SOCIAL_GOOGLE_CLIENT_ID)
            if idinfo['iss'] not in ['accounts.google.com', 'https://accounts.google.com']:
                raise ValueError('Wrong issuer.')
            if idinfo['aud'] not in [SOCIAL_GOOGLE_CLIENT_ID]:
                raise ValueError('Could not verify audience.')
            # Success
            return idinfo
        except ValueError:
            pass

    def create(self, validated_data):
        idinfo = self.verify_token(validated_data.get('token'))
        if idinfo:
            # User not exists
            if not SocialAccount.objects.filter(unique_id=idinfo['sub']).exists():
                user = User.objects.create_user(
                    username=f"{idinfo['name']} {idinfo['email']}", # Username has to be unique
                    first_name=idinfo['given_name'],
                    last_name=idinfo['family_name'],
                    email=idinfo['email']
                )
                SocialAccount.objects.create(
                    user=user,
                    unique_id=idinfo['sub']
                )
                return user
            else:
                social = SocialAccount.objects.get(unique_id=idinfo['sub'])
                return social.user
        else:
            raise ValueError("Incorrect Credentials")

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name']

class TimeslotSerializer(serializers.ModelSerializer):


    class Meta:
        model = record
        fields = '__all__'

