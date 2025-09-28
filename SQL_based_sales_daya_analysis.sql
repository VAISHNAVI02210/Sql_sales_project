-- Sql retail sales analysis--
create database sql_project_p2;

use sql_project_p2;

drop database sql_project_p2;

-- create table retail_sales

drop table if exists retail_sales;
create table retail_sales
    (transactions_id int,
	sale_date date,
	sale_time time,
	customer_id int,
	gender varchar(15),
	age int,
	category varchar(50),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float);
    
    select * from retail_sales;
    
    select count(*) from retail_sales;
    
    -- check if any null value is there present in any coloumn --
    select * from retail_sales
    where transactions_id is null;
    
     select * from retail_sales
     where sale_date is null;
    
     select * from retail_sales
     where sale_time is null;
    
     select * from retail_sales
     where customer_id is null;
    
     select * from retail_sales
     where gender is null;
    
     select * from retail_sales
    where quantiy is null;
    
     select * from retail_sales
    where price_per_unit is null;
    
     select * from retail_sales
    where cogs is null;
    
     select * from retail_sales
     where total_sale is null;
     
     -- Data exploration
     -- how many sales are done --
     select count(*) as total_sales from retail_sales;
    
    -- How many unique customers we have--
    select count(distinct customer_id) as total_customers from retail_sales;
    
    -- how many uniue category we have --
     select count(distinct category) as total_customers from retail_sales;
     
     -- name of the category we used --
     select distinct category from retail_sales;
     
     -- total sales revenue --
     select sum(total_sale) from retail_sales; -- 908230--
     
     -- average sales per transaction --
     select avg(total_sale) from retail_sales; -- 450 --
     
     -- How much revenue does each product category generate? --
     select sum(total_sale) as revenue_per_category,category
     from retail_sales
     group by category
     order by revenue_per_category desc;
     
     -- maximum revenue generated category --
     select max(distinct total_sale) as max_revenue_category,category
     from retail_Sales
     group by category;
     
     -- Total quantity sold per category
     select category, sum(quantiy) as total_units_sold
     from retail_sales
     group by category
     order by total_units_sold desc;
     
     -- How much revenue comes from male vs female customers?
     select sum(total_sale) as revenue_by_gender,gender
     from retail_sales
     group by gender;
     
     -- What is the average age of customers buying each product category?
     select avg(age) as avg_age_customer,category
     from retail_sales
     group by category;
     
     -- What is the total revenue generated each day?
     select sale_date, sum(total_sale) as daily_revenue
     from retail_sales
     group by  sale_date
     order by sale_date;
     
     -- Which product category has the highest total profit?
     select category, sum(total_sale - cogs) as total_profit
     from retail_sales
     group by category
	 order by total_profit desc;
     
     -- Which are the 5 highest value sales transactions?
     select transactions_id, total_sale, customer_id, sale_date
     from retail_sales
     order by total_sale desc
     limit 5;
     
     -- my analysis and findings --
     
     -- 1) write an sql query to retrive all coloumns of sales made on '2022-11-05' ==
     select * from retail_sales
     where sale_date = '2022-11-05';
     
     -- Q.2 Write a SQL query to retrieve all transactions where the category is
     -- 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
     
     select transactions_id,sum(quantiy)
     from retail_sales
     where category = 'clothing' and
     quantiy >= 2 and
     sale_date  between '2022-11-01' and '2022-11-30'
     group by transactions_id;
     
     --  Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
     
     use sql_project_p2;
     
       select category, 
       sum(total_sale) as total_sales
       from retail_sales
	   group by category;
       
      -- Q.4 Write a SQL query to find the average age of customers who
	 --  purchased items from the 'Beauty' category.
     
     select customer_id, avg(age) as avg_age_customer
     from retail_sales
     where category = 'Beauty'
     group by customer_id;
     
     -- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
     
     select * from retail_sales
     where total_sale > 1000;
     
     -- Q.6 Write a SQL query to find the total number of 
      -- transactions (transaction_id) made by each gender in each category.
      
      select gender,category, count(transactions_id) as total_transaction
      from retail_sales
      group by gender,category;
      
     -- Q.7 Write a SQL query to calculate the average sale for each month. 
      -- Find out best selling month in each year
      
      select year(sale_date) as year,
      month(sale_date) as month,
      avg(total_sale) as avg_monthly_sale
      from retail_sales
      group by year(sale_date), month(sale_date)
      order by year, month;
      
       -- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
       
      select customer_id, sum(total_sale) as total_sales
      from retail_sales
      group by customer_id
      order by total_sales desc
      limit 5;
      
       -- Q.9 Write a SQL query to find the number of unique customers
        -- who purchased items from each category
        
        select count(distinct customer_id),category
        from retail_sales
        group by category;
        
       -- Q.10 Write a SQL query to create each shift and number of orders
        -- (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
        
        select 
        case 
        when hour(sale_time) <= 12 then 'morning'
        when hour(sale_time) > 12 and hour(sale_time) <= 17 then 'afternoon'
        else 'evening'
        end as shift,
        count(*) as number_of_orders
        from retail_sales
        group by shift;
        
        -- End of the project 






     



     

     
     




