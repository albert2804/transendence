from django.urls import path
from django.conf.urls import include
from . import views

urlpatterns = [
    #path("", views.index, name="index"),
    path('', views.home, name="home"),
    path('', include('social_django.urls', namespace='social')),

]

SOCIAL_AUTH_URL_NAMESPACE = 'social'