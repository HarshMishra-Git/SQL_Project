-- 10) Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
--     division
--     product_code
--     product
--     total_sold_quantity
--     rank_order




with cte as
(SELECT division, fsm.product_code, product, sum(sold_quantity) as total_sold_qty,
dense_rank() over (partition by division order by sum(sold_quantity) desc) as rank_order
FROM dim_product as prod
JOIN fact_sales_monthly AS fsm
ON prod.product_code = fsm.product_code
where fiscal_year = 2021
group by division, product_code, product
order by 4 desc, 5 asc)
select division, product_code, product, total_sold_qty, rank_order
from cte
where rank_order <=3;