''' admin.py '''
from django.contrib import admin
from .models import Student, Exam

class StudentAdmin(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'last_name', 'student_id')
class ExamAdmin(admin.ModelAdmin):
    list_display = ('id','exam_name', 'exam_date', 'exam_location')

admin.site.register(Student, StudentAdmin)
admin.site.register(Exam, ExamAdmin)
