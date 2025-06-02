import pandas as pd
from sqlalchemy import create_engine

DB_URI = "postgresql+psycopg2://caruser:carpwd@postgres_staging/staging"

def main():
      df = pd.read_csv("/opt/airflow/data/raw/Car_sales.csv")
      engine = create_engine(DB_URI)
      df.to_sql("car_sales", engine, schema="public", if_exists="replace", index=False)
      print("####################################################")
      print("#### Data loaded successfully into the database ####")
      print("####################################################")

if __name__ == "__main__":
    main()