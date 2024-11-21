# Generated by Django 5.1.1 on 2024-11-21 18:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0007_rename_exam_id_exam_id_remove_exam_capacity_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='exam',
            name='location',
        ),
        migrations.AddField(
            model_name='exam',
            name='exam_location',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='exam',
            name='exam_name',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterModelTable(
            name='exam',
            table='Exams',
        ),
    ]