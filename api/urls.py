from django.urls import path
from . import views

urlpatterns= [
    path('getdrugsRecords/',views.getdrugsRecordsList),
   path('getsingleRecord/<str:pk>/',views.getsingleRecord)
#    path('client-detail/<str:pk>/',views.getData ,name='client-detail')
]