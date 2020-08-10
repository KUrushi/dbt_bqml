SELECT
    store_number,
    sales_year,
    sales_month,
    top_vendor,
    top_category,
    last_year_revenues,
    monthly_revenues,

FROM {{ref("store_monthly_revenues")}}
LEFT JOIN {{ref("last_year_revenue")}}
USING (store_number, sales_year, sales_month)
LEFT JOIN {{ref("category_ranks")}}
USING (store_number, sales_year, sales_month)
LEFT JOIN {{ref("vendor_ranks")}}
USING (store_number, sales_year, sales_month)
