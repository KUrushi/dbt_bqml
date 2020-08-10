WITH revenue AS (
    SELECT 
        store_number,
        sales_year,
        sales_month,
        vendor_number,
        sum(monthly_revenues) as revenues
    FROM
        {{ref("monthly_revenue")}}
    WHERE vendor_number IS NOT NULL
    GROUP BY   
        store_number, sales_year, sales_month, vendor_number
),
row_number AS (
    SELECT
        store_number,
        sales_year,
        sales_month,
        FIRST_VALUE(vendor_number) over (partition by store_number, sales_year, sales_month order by revenues DESC) AS top_vendor
    FROM revenue
)
SELECT 
    store_number,
    sales_year,
    sales_month,
    top_vendor,
FROM 
    row_number
