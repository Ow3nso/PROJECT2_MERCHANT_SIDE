# # ----- 3rd Party Libraries -----
# import os
# import requests
# from celery import shared_task
# from django.conf import settings
# from dotenv import load_dotenv

# # ----- In-Built Libraries -----
# from .models import Transactions

# load_dotenv()
# intasend_secret_api_key = os.getenv('INTASEND_SECRET_API_KEY')

# @shared_task
# def update_transaction_states():
#     transactions = Transactions.objects.filter(state__in=['PENDING', 'PROCESSING'])

#     for transaction in transactions:
#         response = requests.post(
#             'https://sandbox.intasend.com/api/v1/payment/status/',
#             json={
#                 'invoice_id': transaction.invoice_id,
#             },
#             headers={
#                 'Authorization': f'Bearer {intasend_secret_api_key}'
#             },
#         )

#         if response.status_code == 200:
#             data = response.json()
#             state = data.get('state')
#             transaction.state = state
#             transaction.save()

# payments/tasks.py

# payments/tasks.py

# payments/tasks.py

import os
import requests
from django.apps import apps
from celery import shared_task
from google.cloud import firestore
from dotenv import load_dotenv

load_dotenv()
intasend_secret_api_key = os.getenv("INTASEND_SECRET_API_KEY")

# Initialize Firestore client
# db = firestore.Client()


@shared_task
def update_transaction_states():
    firestore_client = apps.get_app_config("payments").firestore_client
    transactions_ref = firestore_client.collection("mytransactions")
    query = transactions_ref.where("status", "in", ["PENDING", "PROCESSING"])
    transactions = query.stream()

    for transaction in transactions:
        transaction_data = transaction.to_dict()
        #         print(f"Transaction Data: {transaction_data}")

        if not transaction_data.get("invoiceId"):
            #             print(f"Transaction {transaction.id} does not have an invoice_id. Skipping...")
            continue

        response = requests.post(
            "https://sandbox.intasend.com/api/v1/payment/status/",
            json={
                "invoice_id": transaction_data["invoiceId"],  # Use the invoice_id field
            },
            headers={"Authorization": f"Bearer {intasend_secret_api_key}"},
        )

        print(f"Response status code: {response.status_code}")
        print(f"Response data: {response.json()}")

        if response.status_code == 200:
            data = response.json()
            invoice = data.get("invoice", {})
            status = invoice.get("state")
            #             print(f"Transaction ID: {transaction.id.id}, New State: {status}")

            # Update the Firestore document with the new status
            transaction.reference.update({"status": status})
        else:
            print(
                f"Failed to update transaction {transaction.id.id}. Status Code: {response.status_code}, Error: {response.json()}"
            )
