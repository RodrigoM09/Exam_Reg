from django.urls import path
from . import views  # Use only this import for all views

urlpatterns = [
    path('', views.home, name='home'),
    path('site_registration/', views.site_registration, name='site_registration'),
    path('register_exam/', views.register_exam, name='register_exam'),
    path("confirmation/<int:registration_id>/", views.confirmation, name="confirmation"),
    path('view_exams/', views.view_exams, name='view_exams'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('password_reset/', views.login_view, name='password_reset'),
    path('password_reset/done/', views.login_view, name='password_reset_done'),
    path('reset/<uidb64>/<token>/', views.login_view, name='password_reset_confirm'),
    path('reset/done/', views.login_view, name='password_reset_complete'),
    path("profile/", views.profile_view, name="profile"),
    path("profile/reschedule_test/<int:registration_id>/", views.reschedule_test, name="reschedule_test"),
    path("profile/remove_test/<int:registration_id>/", views.remove_test, name="remove_test"),
    path("profile/edit/", views.edit_profile, name="edit_profile"),
]
