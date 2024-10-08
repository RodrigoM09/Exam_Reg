from django.db import models

class Student(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    student_id = models.EmailField(unique=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Exam(models.Model):
    exam_name = models.CharField(max_length=100)
    exam_date = models.DateField()
    student_id = models.IntegerField()
    location = models.CharField(max_length=100, null=True)
    room = models.CharField(max_length=50, null=True)
    exam_time = models.TimeField(null=True)
    capacity = models.IntegerField(null=True)

    class Meta:
        db_table = 'exams'  # Ensure this points to the correct table

    def __str__(self):
        return f"{self.exam_name} - {self.exam_date}"

# login for students and teachers
class User(models.Model):
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    is_student = models.BooleanField(default=False)
    is_teacher = models.BooleanField(default=False)

    def __str__(self):
        return self.username
