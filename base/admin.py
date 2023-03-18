from django.contrib import admin

from .models import user,drug,record,interactingDrugs

admin.site.register(user)
admin.site.register(drug)
admin.site.register(record)
admin.site.register(interactingDrugs)