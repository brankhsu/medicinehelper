from rest_framework import serializers
from base.models import user,drug,record,interactingDrugs


class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = user
        fields = '__all__'


class drugSerializer(serializers.ModelSerializer):
    class Meta:
        model = drug
        fields = '__all__'


class interactingDrugsSerializer(serializers.ModelSerializer):
    class Meta:
        model = interactingDrugs
        fields = '__all__'


class recordSerializer(serializers.ModelSerializer):
    drugs = drugSerializer(many=True, read_only=True)
    interactingDrugs = interactingDrugsSerializer(many=True, read_only=True)

    class Meta:
        model = record
        fields = '__all__'


#class historyRecordSerializer(serializers.ModelSerializer):

