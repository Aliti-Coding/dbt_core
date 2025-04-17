from airflow import DAG
from airflow.decorators import task
from datetime import datetime
import subprocess

with DAG(
    'dbt_run',
    start_date=datetime(2025, 3, 22),
    schedule_interval='@daily',
    catchup=False,
) as dag:

    @task
    def run_dbt():
        """Run the DBT models in the project."""
        command = "bash -c 'source /opt/airflow/dbt_venv/bin/activate && cd /opt/airflow/dbt_project && dbt run'"
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        print(result.stdout)
        if result.returncode != 0:
            raise Exception(f"DBT run failed with error: {result.stderr}")
        return "DBT run completed successfully"

    run_dbt()