from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import userSerializer,drugSerializer,recordSerializer,interactingDrugsSerializer
from base.models import user,drug,record,interactingDrugs


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




