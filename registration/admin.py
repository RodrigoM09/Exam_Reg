from django.contrib import admin
from .models import Student, Exam

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ['first_name', 'last_name', 'student_id']

@admin.register(Exam)
class ExamAdmin(admin.ModelAdmin):
    list_display = ['exam_name', 'exam_date', 'student_id', 'location', 'room', 'exam_time', 'capacity']
    list_filter = ['exam_date', 'location', 'room']
    search_fields = ['exam_name', 'student_id']
    list_per_page = 10
    ordering = ['exam_date', 'exam_time']
    date_hierarchy = 'exam_date'
    fieldsets = (
        (None, {
            'fields': ('exam_name', 'exam_date', 'student_id')
        }),
        ('Exam Details', {
            'fields': ('location', 'room', 'exam_time', 'capacity')
        }),
    )
