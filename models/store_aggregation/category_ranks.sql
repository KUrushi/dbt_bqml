WITH revenue AS (
    SELECT 
        store_number,
        sales_year,
        sales_month,
        category,
        sum(monthly_revenues) as revenues
    FROM
        {{ref("monthly_revenue")}}
    WHERE category IS NOT NULL
    GROUP BY 
        store_number, sales_year, sales_month, category
),
row_number AS (
    SELECT
        store_number,
        sales_year,
        sales_month,
        FIRST_VALUE(category) over (partition by store_number, sales_year, sales_month order by revenues DESC) AS top_category
    FROM 
        revenue
)
SELECT 
    *
FROM 
    row_number
