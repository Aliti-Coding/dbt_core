from airflow import DAG
from airflow.decorators import task
from datetime import datetime

with DAG(
    'hello_world',
    start_date=datetime(2025, 3, 22),
    schedule_interval=None,  # Manual trigger only
    catchup=False,
) as dag:

    @task
    def print_hello():
        print("Hello, World!")
        return "Printed Hello World"

    print_hello()