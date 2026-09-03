--A quick summary showing our top 5 highest-priced products to identify high-value offerings in our portfolio
select product_name,category,unit_price
from products
order by unit_price desc
limit 5

--A breakdown showing total revenue and overall financial performance across each product category
select p.category,
	sum(quantity_sold) AS total_units_sold,
	sum(quantity_sold*unit_price) as total_revenue
from sales s
join products p
on s.product_id=p.product_id
group by p.category
order by total_revenue desc

--An annual sales analysis for management evaluating individual store performance throughout 2024
select 
	st.store_name,
    st.city,
    sum(s.quantity_sold * p.unit_price) AS total_revenue
from sales s
join products p on s.product_id = p.product_id
join stores st on s.store_id = st.store_id
where s.sale_date >= '2024-01-01' and s.sale_date <= '2024-12-31'
group by st.store_name, st.city
order by total_revenue desc;

--A detailed report ranking all products within their respective categories based on total revenue generated.
with productsales as (
    select 
        p.category,
        p.product_name,
        sum(s.quantity_sold * p.unit_price) as total_revenue
    from sales s
    join products p on s.product_id = p.product_id
    group by p.category, p.product_name
)
select 
    category,
    product_name,
    total_revenue,
    dense_rank() over (
        partition by category 
        order by total_revenue desc
    ) as rank_in_category
from productsales
order by category, rank_in_category;

--A year-over-year (YoY) revenue comparison tracking annual sales performance and growth trends from 2023 through 2026
with yearly_sales as (
    select 
        extract(year from s.sale_date) as sale_year,
        sum(s.quantity_sold * p.unit_price) as total_revenue
    from sales s
    join products p on s.product_id = p.product_id
    group by extract(year from s.sale_date)
)
select 
    sale_year,
    round(total_revenue, 2) as total_revenue,
    round(lag(total_revenue) over (order by sale_year), 2) as previous_year_revenue
from yearly_sales
order by sale_year;