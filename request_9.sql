-- 9) Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields,
--   channel
--   gross_sales_mln
--   percentage


with cte1 as (
select channel,
       round(sum((gross_price*sold_quantity)/1000000),2) as gross_sales_mln
from fact_sales_monthly fsm
join fact_gross_price fgp
using (product_code)
join dim_customer
using (customer_code)
where fsm.fiscal_year = 2021
group by channel
order by gross_sales_mln desc)

select channel,
       gross_sales_mln,
       round(gross_sales_mln*100/sum(gross_sales_mln) over(),2) as percentage
from cte1
order by percentage desc;
