from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import userSerializer,drugSerializer,recordSerializer,interactingDrugsSerializer,SocialLoginSerializer,returnSerializer,notificationSerializer,drugPositionSerializer,reminderSerializer,hospitalDepartmentsSerializer,historyRecordSerializer,todayreminderSerializer
from base.models import user,drug,record,interactingDrugs,reminder,historyRecord
from rest_framework.permissions import IsAuthenticated, IsAdminUser,AllowAny
from rest_framework.response import Response
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import status

@api_view(['GET'])
def getdrugsRecordsList(request):
    queryset = record.objects.all()
    Serializer = recordSerializer(queryset,many =True)
    return Response(Serializer.data)


@api_view(['GET'])
def getsingleRecord(request,pk):
    queryset = record.objects.filter(id=pk)
    Serializer = recordSerializer(queryset, many=True)
    return Response(Serializer.data)
@api_view(['GET'])
def interactingDrugs(request,name):

    return Response()
@api_view(['POST'])
def createDrugRecord(request):
    Serializer = recordSerializer(data=request.data)
    if Serializer.is_valid():
        Serializer.save()
        return Response(status=status.HTTP_201_CREATED)
    return Response(status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def updateDrugRecord(request,pk):
    queryset = record.objects.filter(id=pk)
    Serializer = recordSerializer(instance=queryset , data = request.data)
    if Serializer.is_valid():
        Serializer.save()
    return Response(Serializer.data)


@api_view(['GET'])
def drugPosition(request):
    queryset = record.objects.all()
    Serializer = drugPositionSerializer(queryset, many=True)
    return Response(Serializer.data)


@api_view(["GET", "DELETE"])
def todayReminders(request,pk):
    if request.method == "GET":
        queryset = record.objects.all()
        serializer = reminderSerializer(queryset, many=True)
        Serializer = todayreminderSerializer(data=serializer.data)
        if Serializer.is_valid():
            Serializer.save()
        return Response(serializer.data)
    elif request.method == "DELETE":
        reminder.objects.get(id=pk).delete()
        queryset = reminder.objects.all()
        serializer = todayreminderSerializer(queryset, many=True)
        return Response(serializer.data)

@api_view(['GET'])
def hospitalDepartments(request):
    departments = record.objects.values('hospitalDepartment').distinct()
    serializer = hospitalDepartmentsSerializer(departments, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def takeRecords(request):
    Serializer = historyRecordSerializer(data = request.data)
    if Serializer.is_valid():
        status = Serializer.validated_data.get('status')
        if status == 0:
            Serializer.save()
            return Response({'message': 'Status 0 action executed.'})
        elif status == 1:
                drug_id = Serializer.validated_data['drug']['id']
                # 根據 drug_id 找到對應的 record
                drug_instance = drug.objects.get(id=drug_id)
                record_instance = drug_instance.rid
                # 更新 record 的 stock 屬性
                record_instance.stock -= 1
                record_instance.save()
                # 創建 historyRecord
                return Response({'message': 'Status 1 action executed.'})
        elif status == 2:
            Serializer.save()
            return Response({'message': 'Status 2 action executed.'})
    return Response(Serializer.errors, status=400)

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




