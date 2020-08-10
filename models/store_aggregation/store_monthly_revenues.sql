WITH revenue AS (
    SELECT
        store_number,
        sales_year,
        sales_month,
        sum(monthly_revenues) as monthly_revenues
    FROM
        {{ref("monthly_revenue")}}
    group by store_number, sales_year, sales_month
)
SELECT * 
FROM revenue