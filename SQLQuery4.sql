-- KPI's 

select count(customer_id) 'Total Customers' from customer_shopping_data

select sum(quantity) 'Total Quantities' from customer_shopping_data

select format(sum(price),'0.000') 'Total Revenue' from customer_shopping_data

select count(distinct shopping_mall) 'No. of Malls' from customer_shopping_data

select format(sum(price) / count(invoice_no) ,'0.000' )'Average Invoice Value' from customer_shopping_data

-----------------------------------------------------------------------------------------------------------
-- total sales by gender
select gender , format(sum(price),'0.000') 'Total sales' from customer_shopping_data
group by gender
order by 2 desc
-----------------------------------------------------------------------------------------------------------
-- total sales by category
select category ,  format(sum(price),'0.000') 'Total sales'  from customer_shopping_data
group by category
order by sum(price) desc
-----------------------------------------------------------------------------------------------------------
-- total sales by mall
select shopping_mall ,  format(sum(price),'0.000') 'Total sales'  from customer_shopping_data
group by shopping_mall
order by sum(price) desc
-----------------------------------------------------------------------------------------------------------
-- total sales by payment_method
select payment_method ,  format(sum(price),'0.000') 'Total sales'  from customer_shopping_data
group by payment_method
order by sum(price) desc
-----------------------------------------------------------------------------------------------------------
-- total quantities by category
select category , sum(quantity) 'Total Quantities' from customer_shopping_data
group by category
order by 2 desc
-----------------------------------------------------------------------------------------------------------
-- Monthly trend --> total sales by month
select datename(month,invoice_date) 'Month ',  format(sum(price),'0.000') 'Total sales'  from customer_shopping_data
group by datename(month,invoice_date)
order by 2 desc

-----------------------------------------------------------------------------------------------------------
-- Yearly trend --> total sales by year
select year(invoice_date) 'Year',  format(sum(price),'0.000') 'Total sales'  from customer_shopping_data
group by year(invoice_date)
order by 2 desc

-----------------------------------------------------------------------------------------------------------
-- Percentage of sales in 2022 compared to 2021 and 2023
select round(
            sum(case when YEAR(invoice_date) = 2022 then price else 0 end)
            / (sum(case when YEAR(invoice_date) = 2021 then price else 0 end)
	        +  sum(case when YEAR(invoice_date) = 2023 then price else 0 end)) ,4)*100 '2023 percentage_increase'
from customer_shopping_data

-----------------------------------------------------------------------------------------------------------
-- Total Revenue throgh months & year
select format(invoice_date,'MMMM yyyy') 'Month' , format(sum(price),'0.000') 'Total Revenue'
from customer_shopping_data
--where YEAR(invoice_date) =2023
group by format(invoice_date,'MMMM yyyy')
order by sum(price) desc
-----------------------------------------------------------------------------------------------------------
-- Top 3 Months revenue through 3 years
select TOP 3 datename(month,invoice_date) 'Month' , format(sum(price),'0.000') 'Total Revenue'
from customer_shopping_data
group by datename(month,invoice_date) 
order by 2 desc

-----------------------------------------------------------------------------------------------------------
-- Bottom 3 Months revenue through 3 years
select TOP 3 datename(month,invoice_date) 'Month' , format(sum(price),'0.000') 'Total Revenue'
from customer_shopping_data
group by datename(month,invoice_date) 
order by 2 
-----------------------------------------------------------------------------------------------------------


