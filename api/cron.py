from django_cron import CronJobBase, Schedule
from .serializers import reminderSerializer
from base.models import user,drug,record,interactingDrugs,reminder,historyRecord

class TodayRemindersCronJob(CronJobBase):
    RUN_AT_TIMES = ['12:00']  # 设置执行时间，此处为每天的 12:00

    schedule = Schedule(run_at_times=RUN_AT_TIMES)
    code = 'your_app.today_reminders_cron_job'  # 给定一个唯一的代码

    def do(self):
        # 在这里编写要执行的代码
        queryset = record.objects.all()
        serializer = reminderSerializer(queryset, many=True)
        if serializer.is_valid():
            serializer.save()