from django.urls import path
from .views import register_exam, home, view_exams, login_view, logout_view, confirmation, site_registration

urlpatterns = [
    path('', home, name='home'),  # Landing page
    path('site_registration/', site_registration, name='site_registration'),  # Site Registration page
    path('register_exam/', register_exam, name='register_exam'),  # Exam Registration page
    path("confirmation/<int:registration_id>/", confirmation, name="confirmation"),
    path('view_exams/', view_exams, name='view_exams'),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('password_reset/', login_view, name='password_reset'),
    path('password_reset/done/', login_view, name='password_reset_done'),
    path('reset/<uidb64>/<token>/', login_view, name='password_reset_confirm'),
    path('reset/done/', login_view, name='password_reset_complete'),
]
