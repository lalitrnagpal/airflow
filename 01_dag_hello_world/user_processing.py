from airflow.models import DAG
from airflow.providers.sqlite.operators.sqlite import SqliteOperator

from datetime import datetime

default_args = {
    'start_date': datetime(2020, 1, 1)
}

with DAG('user_processing', schedule_interval='@daily',
        default_args=default_args,
        catchup=False) as dag:

        #Define tasks/operators
        create_table = SqliteOperator(
            task_id='create_table',
            sqlite_conn_id='db_sqlite',
            sql='''
                CREATE TABLE users(
                    email TEXT NOT NULL PRIMARY KEY,
                    firstname TEXT NOT NULL,
                    lastname TEXT NOT NULL,
                    country TEXT NOT NULL,
                    username TEXT NOT NULL,
                    password TEXT NOT NULL
                );
            '''
        )