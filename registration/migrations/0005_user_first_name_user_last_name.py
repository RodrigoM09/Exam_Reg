# Generated by Django 5.1.1 on 2024-11-20 21:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0004_remove_student_password_remove_student_username_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='first_name',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='last_name',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
