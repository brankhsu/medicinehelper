from rest_framework import serializers
from base.models import user,drug,record,interactingDrugs,SocialAccount
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


class interactingDrugsSerializer(serializers.ModelSerializer):
    class Meta:
        model = interactingDrugs
        fields = '__all__'


class notificationSerializer(serializers.ModelSerializer):

    class Meta:
        model = record
        fields = ['notification_status', 'notification_startDate', 'notification_remind', 'notification_repeat']


class returnSerializer(serializers.ModelSerializer):
    class Meta:
        model = record
        fields = ['return_status', 'return_date', 'return_left', 'return_repeat']


class recordSerializer(serializers.ModelSerializer):
    drugs = drugSerializer(many=True, read_only=True)
    interactingDrugs = interactingDrugsSerializer(many=True, read_only=True)
    notificationSetting = notificationSerializer(source='*')
    returnSetting = returnSerializer(source='*')
    class Meta:
        model = record
        fields = ['id','drugs','ondemand','interactingDrugs','dosage','stock','position','frequency','timeSlot_1','timeSlot_2','timeSlot_3','timings_1','timings_2','notificationSetting','returnSetting']


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

