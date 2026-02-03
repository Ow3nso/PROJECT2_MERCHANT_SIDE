# # ----- 3rd Party Libraries -----
# from __future__ import absolute_import, unicode_literals
# import os
# from celery import Celery
# from celery.schedules import crontab

# # set the default Django settings module for the 'celery' program.
# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend_payment_apis.settings')

# app = Celery('backend_payment_apis')

# app.conf.beat_schedule = {
#     'update-transaction-states-every-1-minute': {
#         'task': 'payments.tasks.update_transaction_states',
#         'schedule': crontab(minute='*/1'),  # every 1 minute
#     },
# }

# # Using a string here means the worker doesn't have to serialize
# # the configuration object to child processes.
# app.config_from_object('django.conf:settings', namespace='CELERY')

# # Load task modules from all registered Django app configs.
# app.autodiscover_tasks()

# backend_payment_apis/celery.py

from __future__ import absolute_import, unicode_literals
import os
from celery import Celery
from datetime import timedelta
from celery.schedules import crontab

# set the default Django settings module for the 'celery' program.
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "backend_payment_apis.settings")

app = Celery("backend_payment_apis")

# Using a string here means the worker doesn't have to serialize
# the configuration object to child processes.
app.config_from_object("django.conf:settings", namespace="CELERY")

# Load task modules from all registered Django app configs.
app.autodiscover_tasks()


@app.task(bind=True)
def debug_task(self):
    print(f"Request: {self.request!r}")


# Schedule the task to run every 5 minutes
app.conf.beat_schedule = {
    "update-transaction-states-every-5-seconds": {
        "task": "payments.tasks.update_transaction_states",
        "schedule": timedelta(seconds=5),  # every 5 seconds
    },
}

app.conf.timezone = "UTC"
