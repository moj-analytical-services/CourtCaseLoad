from airflow import DAG
from airflow.operators.bash_operator import BashOperator

dag = DAG(
    dag_id='execute_court_caseload',
    description='Runs court caseload extract notebook',
    schedule_None,  # Manual triggers only
    tags=['HCMS'],
)

run_notebook = BashOperator(
    task_id='execute_notebook',
    bash_command='papermill court_caseload_wb.ipynb court_caseload_wb_output.ipynb',
    dag=dag,
)
