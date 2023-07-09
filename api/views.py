from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import userSerializer,drugSerializer,recordSerializer,interactingDrugsSerializer,SocialLoginSerializer,returnSerializer,notificationSerializer,drugPositionSerializer,reminderSerializer,hospitalDepartmentsSerializer,todayreminderSerializer,takeRecordSerializer
from base.models import user,drug,record,interactingDrugs,reminder
from rest_framework.permissions import IsAuthenticated, IsAdminUser,AllowAny
from rest_framework.response import Response
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import status
import datetime
from django.db.models import Q

@api_view(['GET','POST'])
def drugsRecords(request):
    if request.method == 'GET':
        queryset = record.objects.all()
        Serializer = recordSerializer(queryset,many =True)
        return Response(Serializer.data)
    if request.method == 'POST':
        drug = request.data.get('drug')
        drugname = request.data.get('name')

        if drug.objects.filter(name=drugname).exist:
            record_instance = drug.objects.filter(name=drugname).rid
            Serializer = recordSerializer(instance=record_instance, data=request.data)
            if Serializer.is_valid():
                Serializer.save()
            return Response({'success': True})
        else:
            Serializer = recordSerializer(data=request.data)
            if Serializer.is_valid():
                Serializer.save()
                return Response(status=status.HTTP_201_CREATED)
            return Response(status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET',"DELETE","PATCH"])
def singleRecordWithid(request,pk):
    if request.method == 'GET':
        queryset = record.objects.filter(id=pk)
        Serializer = recordSerializer(queryset, many=True)
        return Response(Serializer.data)

    if request.method == 'DELETE':
        drug_instance = drug.objects.filter(rid_id=pk)
        reminders = reminder.objects.filter(drug_id=drug_instance.id)
        reminders.delete()
        historyRecord = reminder.objects.filter(drug_id=drug_instance.id)
        historyRecord.delete()
        record_instance =record.objects.get(id=pk)
        record_instance.delete()
        return Response("SUCCESS")

    if request.method == 'PUT':
        queryset = record.objects.filter(id=pk)
        Serializer = recordSerializer(instance=queryset, data=request.data)
        if Serializer.is_valid():
            Serializer.save()
        return Response(Serializer.data)

@api_view(['GET'])
def drugsRecordswithName(request,name):
    queryset = drug.objects.filter(name__startswith=name)
    if queryset.exists():
        if queryset.count() == 1:
            record_instance = queryset.rid
            Serializer = recordSerializer(record_instance)
            return Response(Serializer.data)
        elif queryset.count() >= 2:
            record_instances = [d.rid for d in queryset]

            # 使用recordSerializer对记录进行序列化
            Serializer = recordSerializer(record_instances, many=True)
            return Response(Serializer.data)
    else:
        return Response("drug not found")
@api_view(['GET'])
def drugsRecordswithhospitalName(request,hospitalName):
    queryset = record.objects.filter(hospitalName__startswith=hospitalName)
    if queryset.exists():
        if queryset.count() == 1:
            Serializer = recordSerializer(queryset)
            return Response(Serializer.data)
        elif queryset.count() >= 2:
            # 使用recordSerializer对记录进行序列化
            Serializer = recordSerializer(queryset, many=True)
            return Response(Serializer.data)
    else:
        return Response("record not found")

@api_view(['GET'])
def drugsRecordsonDemand(request):
    queryset = record.objects.filter(ondemand=True)
    if queryset.exists():
        if queryset.count() == 1:
            Serializer = recordSerializer(queryset)
            return Response(Serializer.data)
        elif queryset.count() >= 2:
            # 使用recordSerializer对记录进行序列化
            Serializer = recordSerializer(queryset, many=True)
            return Response(Serializer.data)
    else:
        return Response("record not found")
@api_view(['GET'])
def hospitalDepartments(request):
    departments = record.objects.values('hospitalDepartment').distinct()
    serializer = hospitalDepartmentsSerializer(departments, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def drugPosition(request):
    queryset = record.objects.all()
    Serializer = drugPositionSerializer(queryset, many=True)
    return Response(Serializer.data)


@api_view(["DELETE","PUT","GET"])
def RemindersWithid(request,pk):
    if request.method == 'DELETE':
        reminder.objects.get(id=pk).delete()
        return Response()
    elif request.method == 'PUT':
        queryset = reminder.objects.filter(id=pk)
        Serializer = todayreminderSerializer(instance=queryset, data=request.data)
        if Serializer.is_valid():
            Serializer.save()
            Response(Serializer.data)
        return Response(Serializer.errors, status=400)
    elif request.method == 'GET':
        queryset = reminder.objects.filter(id=pk)
        Serializer = todayreminderSerializer(queryset ,many=True)
        return Response(Serializer.data)


@api_view(['GET'])
def todayReminders(request):
    today = datetime.date.today()
    reminders = reminder.objects.filter(date=today)
    if not reminders.exists():
        queryset = record.objects.all()
        Serializer = reminderSerializer(queryset, many=True)
        reminders_data = Serializer.data  # 获取序列化后的数据列表

        # 创建reminder模型
        for reminder_data in reminders_data:
            drug_data = reminder_data.pop('drug')
            dosage = reminder_data.pop('dosage')
            position = reminder_data.pop('position')
            stock = reminder_data.pop('stock')

            reminder_data['rid_id'] = reminder_data.pop('id')  # 将id字段的值赋给rid字段
            reminder_data['drug_id'] = drug_data['id']
            reminder_data['drug_name'] = drug_data['name']
            reminder_instance = reminder.objects.create(**reminder_data)

    queryset = reminder.objects.filter(status=0,date = datetime.datetime.today().date())
    serializer = todayreminderSerializer(queryset, many=True)
    return Response(serializer.data)


@api_view(['POST','GET'])
def takeRecords(request):
    if request.method == 'POST':
        status = request.data.get('status')
        pk = request.data.get('id')
        if status != 4:
            reminder_instance = reminder.objects.get(id=pk)
            if status == 1:
                if(reminder_instance.status ==1):
                    return Response({'error': "this drug has been taken"})
                # 根據 drug_id 找到對應的 record
                record_instance = reminder_instance.rid
                # 更新 record 的 stock 屬性
                record_instance.stock -= 1
                reminder_instance.status = 1
                reminder_instance.timeslot = request.data.get('timeslot')
                record_instance.save()
                reminder_instance.save()
                return Response({'Success': True})
            elif status == 2:
                reminder_instance.status = 2
                reminder_instance.save()
                return Response({'Success': True})
            elif status == 3:
                reminder_instance.status = request.data.get('timeslot')
                reminder_instance.save()
                return Response({'success': True})
        elif status == 4:
            timeslot = request.data.get('batchTime')
            timeslot_start = datetime.datetime.strptime(str(timeslot), '%H').time()
            timeslot_end = (datetime.datetime.strptime(str(timeslot), '%H') + datetime.timedelta(minutes=59)).time()

            # 在给定的时间段内更新status字段为1的reminder记录
            reminders = reminder.objects.filter(timeSlot__gte=timeslot_start, timeSlot__lt=timeslot_end,date=datetime.datetime.today().date())
            for reminder_instance in reminders:
                record_instance = reminder_instance.rid
                if(record_instance.stock==0):
                    return Response({'Error':"stock = 0"})
                record_instance.stock -= 1
                record_instance.save()
            reminders.update(status=1)
            reminders.save()
            return Response({'success': True})
    elif request.method == 'GET':
        today = datetime.date.today()
        queryset = reminder.objects.filter(
            Q(date__lt=today) | (Q(date=today) & Q(status=1))| (Q(date=today) & Q(status=2))
        )
        Serializer = todayreminderSerializer(queryset, many=True)

        return Response(Serializer.data)


def takeRecordsWithName(request,drugname):

    return

@api_view(['PUT','GET'])
def takeRecordsWithId(request,pk):
    if request.method == 'POST':
        status = request.data.get('status')
        queryset = reminder.objects.filter(id=pk)
        Serializer = todayreminderSerializer(instance=queryset, data=request.data)
    elif request.method == 'GET':
        queryset = reminder.objects.get(id=pk)
        Serializer = todayreminderSerializer(queryset)
        return Response(Serializer.data)
    elif request.method == 'PUT':
        queryset = reminder.objects.get(id=pk)
        Serializer = todayreminderSerializer(instance=queryset,data=request.data)
        if Serializer.is_valid():
            Serializer.save()
            return Response(Serializer.data)
        return Response({'Error':"update fail"})

@api_view(['GET'])
def get_tokens_for_user(user):
    refresh = RefreshToken.for_user(user)
    return {
        'refresh': str(refresh),
        'access': str(refresh.access_token),
    }


class GoogleLogin(TokenObtainPairView):
    permission_classes = (AllowAny,)  # AllowAny for login
    serializer_class = SocialLoginSerializer

    def post(self, request):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            user = serializer.save()
            return Response(get_tokens_for_user(user))
        else:
            raise ValueError('Not serializable')




