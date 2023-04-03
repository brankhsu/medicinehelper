from django.urls import path
from . import views
from rest_framework_simplejwt import views as jwt_views
from .views import GoogleLogin

urlpatterns= [
    path('getdrugsRecords/',views.getdrugsRecordsList),
    path('getsingleRecord/<str:pk>/',views.getsingleRecord),
#   path('client-detail/<str:pk>/',views.getData ,name='client-detail')
    path('token/obtain/', GoogleLogin.as_view()),
    path('token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
]