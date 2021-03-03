sudo apt update -y
sudo apt upgrade -y

sudo apt install python3 python3-dev python3-venv -y

wget https://bootstrap.pypa.io/get-pip.py

sudo python3 get-pip.py

# Install Airflow now

export AIRFLOW_VERSION=2.0.1

export PYTHON_VERSION=3.8

export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

sudo -H pip3 install --ignore-installed PyYAML

sudo -H pip3 install --ignore-installed pyasn1.modules

sudo pip install "apache-airflow[postgres,google]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}" 

airflow db init

airflow webserver > /dev/null 2>&1 &

airflow scheduler > /dev/null 2>&1 &

airflow users create -u admin -p admin -f lalit -l nagpal -r Admin -e admin@airflow.com

mkdir /home/lalitgcp8/code

cd /home/lalitgcp8/code

git clone https://github.com/lalitrnagpal/airflow.git

cd /home/lalitgcp8/code/airflow

cd 05_sqlite_httpsensor_httpoperator_python_bash_operator

mkdir ./user_processing.py /home/lalitgcp8/airflow/dags

cp user_processing.py ./user_processing.py /home/lalitgcp8/airflow/dags

cd /home/lalitgcp8/airflow/dags

sudo pip install apache-airflow-providers-sqlite

sudo pip install pysqlite3

sudo pip install apache-airflow-providers-http

sudo apt install postgresql -y

sudo apt install sqlite3 -y

sqlite3

.open /home/lalitgcp8/airflow/airflow.db

drop table if exists users;

.exit



