from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.docker.operators.docker import DockerOperator
from datetime import datetime, timedelta
import os
from docker.types import Mount

default_args = {
    'owner': 'mati',
    'depends_on_past': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='car_sales_elt',
    default_args=default_args,
    start_date=datetime(2025, 6, 1),
    schedule='@once',
    catchup=False,
    tags=['car_sales'],
) as dag:

    def extract_and_load():
        from scripts.extract_load import main
        main()

    t1 = PythonOperator(
        task_id='extract_load_to_staging',
        python_callable=extract_and_load
    )

    t2 = DockerOperator(
        task_id='dbt_run',
        image='ghcr.io/dbt-labs/dbt:latest',
        api_version='auto',
        auto_remove='force',
        command=[
            'run',
            '--profiles-dir', '/root/.dbt',
            '--project-dir', '/opt/airflow/dbt_project'
        ],
        docker_url='unix://var/run/docker.sock',
        network_mode='bridge',
        mounts=[
            Mount(
                source='/Users/matioszkea/.dbt',
                target='/root/.dbt',
                type='bind'
            ),
            Mount(
                source='/Users/matioszkea/Projects/CarSalesELT/dbt_project',
                target='/opt/airflow/dbt_project',
                type='bind'
            )
        ]
    )

    t1 >> t2