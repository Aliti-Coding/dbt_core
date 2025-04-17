FROM apache/airflow:2.8.1

USER root
RUN apt-get update && apt-get install -y python3-venv

USER airflow
RUN python3 -m venv /opt/airflow/dbt_venv && \
    /opt/airflow/dbt_venv/bin/pip install --upgrade pip --no-user && \
    /opt/airflow/dbt_venv/bin/pip install dbt-core dbt-postgres --no-user