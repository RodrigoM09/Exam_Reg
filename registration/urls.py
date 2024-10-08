from django.urls import path
from .views import register_exam, home, view_exams, login, logout

urlpatterns = [
    path('', home, name='home'),  # Landing page
    path('register/', register_exam, name='register_exam'),  # Registration page
    path('exams', view_exams, name='view_exams'),
    path('login/', login, name='login'),
    path('logout/', home, name='logout'),
]
