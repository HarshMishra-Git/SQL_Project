-- 6) Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the 
--   Indian market. The final output contains these fields,
--   customer_code
--   customer
--   average_discount_percentage


select 
    c.customer_code,
    customer,
    avg(pre_invoice_discount_pct) as average_discount_percentage
from
    dim_customer as c
        left join
    fact_pre_invoice_deductions as d on c.customer_code = d.customer_code
where
    fiscal_year = 2021
        and lower(market) like 'india'
group by c.customer_code , customer
order by 3 desc
limit 5;
