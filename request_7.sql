
-- 7) Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and 
--   high-performing months and take strategic decisions. The final report contains these columns:
--   Month
--   Year
--   Gross sales Amount


select month(date) as Month, 
year(date) as Year, round((sum(fgp.gross_price*fsm.sold_quantity)),2) as Gross_sales_Amount 
from fact_gross_price fgp
join fact_sales_monthly fsm on fsm.product_code=fgp.product_code
join dim_customer dm on fsm.customer_code=dm.customer_code
where customer="Atliq Exclusive"
group by Month, Year
order by Year;

