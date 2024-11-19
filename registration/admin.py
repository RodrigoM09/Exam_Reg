# admin.py
from django.contrib import admin
from .models import Student, Exam

class StudentAdmin(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'last_name', 'student_id')  # Ensure these match the actual field names in your model

class ExamAdmin(admin.ModelAdmin):
    list_display = ('exam_id', 'exam_name', 'exam_date', 'location', 'room', 'time', 'capacity')  # Ensure these match the fields in Exam

admin.site.register(Student, StudentAdmin)
admin.site.register(Exam, ExamAdmin)
