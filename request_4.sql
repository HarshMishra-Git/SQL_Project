-- 4) Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,
--   segment
--   product_count_2020
--   product_count_2021
--   difference


with cte1 as (
select p.segment,
count(distinct (p.product_code)) 
as unique_product_2020
from dim_product p
join fact_sales_monthly fs 
on p.product_code=fs.product_code
where fiscal_year = 2020
group by segment),

cte2 as (
select p.segment,
count(distinct (p.product_code)) 
as unique_product_2021
from dim_product p
join fact_sales_monthly fs  
on p.product_code=fs.product_code
where fiscal_year = 2021
group by segment)

select segment,
       unique_product_2020,
       unique_product_2021,
       (unique_product_2021-unique_product_2020) as diff
from cte1
join cte2
using (segment)
order by diff desc;