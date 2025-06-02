#!/usr/bin/env bash
set -e


# Wait until Postgres (staging) is ready
export PGPASSWORD=carpwd
ATTEMPTS=0
until pg_isready -h postgres_staging -p 5432 -U caruser -d staging; do
  ATTEMPTS=$((ATTEMPTS+1))
  echo "Waiting for postgres... attempt ${ATTEMPTS}/30"
  if [ ${ATTEMPTS} -ge 30 ]; then
    echo "Postgres did not become available in time. Exiting."
    exit 1
  fi
  sleep 2
done
echo "Postgres is ready!"

airflow db migrate

python3 /opt/airflow/scripts/create_admin.py # TODO: NEED TO FIX, 'ab_user' TABLE IS NOT CREATED YET IDK WHY AND WHAT TO DO PLZ HELP ME

python3 /opt/airflow/scripts/extract_load.py

exec airflow standalone