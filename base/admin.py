from django.contrib import admin

from .models import user,drug,record,interactingDrugs,timeslots

admin.site.register(user)
admin.site.register(drug)
admin.site.register(record)
admin.site.register(interactingDrugs)
admin.site.register(timeslots)