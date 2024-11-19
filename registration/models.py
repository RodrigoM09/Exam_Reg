# models.py
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.utils import timezone
from django.conf import settings

class UserManager(BaseUserManager):
    def create_user(self, username):
        if not username:
            raise ValueError('The username must be set')
        user = self.model(
            username=username,
        )
        user.save(using=self._db)
        return user

    def create_superuser(self, username):
        user = self.create_user(
            username=username,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user
class User(AbstractBaseUser):
    student_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    is_student = models.BooleanField(default=False)
    is_teacher = models.BooleanField(default=False)
    last_login = models.DateTimeField(default=timezone.now)


    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []

    def __str__(self):
        return self.username

    @property
    def is_anonymous(self):
        return False

    @property
    def is_authenticated(self):
        return True
class Student(models.Model):
    id = models.BigAutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    student_id = models.CharField(max_length=20, unique=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name} ({self.student_id})"

class Exam(models.Model):
    exam_id = models.AutoField(primary_key=True)
    exam_name = models.CharField(max_length=100)
    exam_date = models.DateField()
    location = models.CharField(max_length=100, null=True)
    room = models.CharField(max_length=50, null=True)
    time = models.TimeField(null=True)
    capacity = models.IntegerField()

    def __str__(self):
        return self.exam_name


