# Generated by Django 5.1.1 on 2024-11-19 02:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0002_user_student'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='user_id',
            new_name='student_id',
        ),
        migrations.RemoveField(
            model_name='user',
            name='student',
        ),
    ]
