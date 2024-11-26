# Generated by Django 5.1.1 on 2024-11-23 04:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0008_remove_exam_location_exam_exam_location_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Registered',
            fields=[
                ('registration_id', models.AutoField(primary_key=True, serialize=False)),
                ('student_id', models.BigIntegerField()),
                ('exam_id', models.BigIntegerField()),
                ('username', models.CharField(max_length=50, null=True)),
                ('first_name', models.CharField(max_length=50, null=True)),
                ('last_name', models.CharField(max_length=50, null=True)),
                ('exam_name', models.CharField(max_length=255, null=True)),
                ('exam_date', models.DateField(null=True)),
                ('exam_location', models.CharField(max_length=255, null=True)),
            ],
        ),
    ]
