# Generated by Django 4.1.7 on 2023-05-22 18:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0034_timings'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='record',
            name='comment',
        ),
    ]