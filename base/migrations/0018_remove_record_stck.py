# Generated by Django 4.1.7 on 2023-03-18 06:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0017_remove_record_stock_record_stck'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='record',
            name='stck',
        ),
    ]
