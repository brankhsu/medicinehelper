# Generated by Django 4.1.7 on 2023-03-11 04:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0008_record_interactingdrugs'),
    ]

    operations = [
        migrations.AlterField(
            model_name='interactingdrugs',
            name='level',
            field=models.CharField(max_length=20),
        ),
    ]