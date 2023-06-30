from django.urls import path
from . import views
from rest_framework_simplejwt import views as jwt_views
from .views import GoogleLogin

urlpatterns= [
    path('drugsRecords/',views.drugsRecords),
    path('drugRecords/<str:pk>/',views.singleRecordWithid),
    path('interactingDrugs?drugName=<str:name>',views.interactingDrugs),
    #path('createDrugRecord', views.createDrugRecord),
    #path('updateDrugRecord/<str:pk>/', views.updateDrugRecord),
    path('token/obtain/', GoogleLogin.as_view()),
    path('token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    path('todayReminders/<str:pk>',views.RemindersWithid),
    #path('todayReminders/timeSlot=<str:timeslot>', views.RemindersWithtime),
    path('todayReminders',views.todayReminders),
    path('hospitalDepartments/', views.hospitalDepartments),
    path('takeRecords',views.takeRecords),
    path('takeRecords/<str:pk>', views.takeRecordsWithId),
    path('drugRecords?drug.name=<str:pk>',views.takeRecordsWithName)

]