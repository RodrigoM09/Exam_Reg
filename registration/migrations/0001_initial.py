# Generated by Django 5.1.1 on 2024-11-06 00:29

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=50, unique=True)),
                ('password', models.CharField(max_length=50)),
                ('is_student', models.BooleanField(default=False)),
                ('is_teacher', models.BooleanField(default=False)),
                ('last_login', models.DateTimeField(default=django.utils.timezone.now)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Exam',
            fields=[
                ('exam_id', models.AutoField(primary_key=True, serialize=False)),
                ('exam_name', models.CharField(max_length=100)),
                ('exam_date', models.DateField()),
                ('location', models.CharField(max_length=100, null=True)),
                ('room', models.CharField(max_length=50, null=True)),
                ('time', models.TimeField(null=True)),
                ('capacity', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('first_name', models.CharField(max_length=50)),
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('last_name', models.CharField(max_length=50)),
                ('student_id', models.CharField(max_length=50, unique=True)),
                ('password', models.CharField(max_length=50)),
                ('username', models.CharField(max_length=50, unique=True)),
            ],
        ),
    ]
