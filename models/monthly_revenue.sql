WITH revenues AS (
    SELECT
        store_number,
        EXTRACT(YEAR from date) AS sales_year,
        EXTRACT(MONTH from date) AS sales_month,
        category,
        vendor_number,
        sum(sale_dollars) AS monthly_revenues
    FROM 
        {{target.schema}}.sales
    GROUP BY
        store_number, sales_year, sales_month, category, vendor_number
)

SELECT * FROM revenues