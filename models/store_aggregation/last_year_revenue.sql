WITH last_year AS (
SELECT 
    a.store_number,
    a.sales_year,
    a.sales_month,
    IFNULL(b.monthly_revenues, 0) AS last_year_revenues
FROM
    {{ref("store_monthly_revenues")}} AS a
LEFT JOIN {{ref("store_monthly_revenues")}} AS b
ON a.store_number = b.store_number
AND a.sales_year - b.sales_year = 1
AND a.sales_month = b.sales_month
)
SELECT 
    *
FROM last_year
