version: 2

models:
  - name: dim_car
    description: >
      Unique combination of make, model, and launch year.
    columns:
      - name: make
        description: Vehicle manufacturer.
        tests: [not_null]
      - name: model
        description: Vehicle model.
        tests: [not_null]
      - name: launch_year
        description: Launch year.
        tests: [not_null]
      - name: vehicle_type
        description: Vehicle type.
      - name: engine_size
        description: Engine size.
      - name: horsepower
        description: Horsepower.

  - name: fact_sales
    description: >
      Sales fact table aggregating total sales and average price per
      month × make × model.
    columns:
      - name: sale_month
        description: First day of the sales month.
        tests: [not_null]
      - name: make
        description: Vehicle manufacturer.
        tests: [not_null]
      - name: model
        description: Vehicle model.
        tests: [not_null]
      - name: total_sales_thousands
        description: Total sales in thousands.
      - name: avg_price_thousands
        description: Average price in thousands.