--Sales,Profit,Number of Orders change over time year

select d.Year,sum(quantity) as Total_quantity,sum(sales) as Total_Sales,sum(profit) as Total_profit
from FactOrders o
join DimDate d
on o.order_date = d.FullDate
group by d.Year
Order by d.Year;

--Sales,Profit,Number of Orders change over time month
select d.Year,d.Month_Name,
sum(quantity) as Total_quantity,sum(sales) as Total_Sales,sum(profit) as Total_profit,
sum(profit)/sum(sales) * 100 as Profit_Margin
from FactOrders o
join DimDate d
on o.order_date = d.FullDate
group by d.Month_Name,d.Year
Order by d.Year;


-- Worst Month 
with MonthlySales As
(
select d.Year,d.Month_Name,
sum(quantity) as Total_quantity,sum(sales) as Total_Sales,
sum(profit) as Total_profit,
sum(profit)/sum(sales) * 100 as Profit_Margin,
rank()over(partition by year order by sum(sales) ) as ranked
from FactOrders o
join DimDate d
on o.order_date = d.FullDate
group by d.Month_Name,d.Year

)
select * from MonthlySales
where ranked = 1
order by Year;

-- Best Month Per Year
with MonthlySales As
(
select d.Year,d.Month_Name,
sum(quantity) as Total_quantity,sum(sales) as Total_Sales,
sum(profit) as Total_profit,
sum(profit)/sum(sales) * 100 as Profit_Margin,
rank()over(partition by year order by sum(sales) desc ) as ranked
from FactOrders o
join DimDate d
on o.order_date = d.FullDate
group by d.Month_Name,d.Year

)
select * from MonthlySales
where ranked = 1
order by Year;

-- Total Sales, Total Orders and Profit Margin Based on Customer Segement
select segment,sum(quantity) as Total_Quantity, 
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
sum(profit)/sum(sales) * 100 as Profit_Margin
from FactOrders
Group by segment;


-- Total Sales, Total Orders and Profit Margin Based on Customer Segement Per Year
select Year,segment,sum(quantity) as Total_Quantity, 
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
sum(profit)/sum(sales) * 100 as Profit_Margin
from FactOrders f
join DimDate d
on f.order_date = d.FullDate
Group by segment,Year
Order by segment,Year;

-- Discount Over the Years
select Year,segment,sum(quantity) as Total_Quantity, 
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
avg(discount) as average_discount,
sum(profit)/sum(sales) * 100 as Profit_Margin
from FactOrders f
join DimDate d
on f.order_date = d.FullDate
Group by segment,Year
Order by segment,Year;


-- which category,subcategory contributes most to decline
select Year,category,sub_category,sum(quantity) as Total_Quantity, 
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
avg(discount) as average_discount,
sum(profit)/sum(sales) * 100 as Profit_Margin
from FactOrders f
join DimDate d
on f.order_date = d.FullDate
join  DimProduct p
on f.product_id = p.product_id
where segment = 'Corporate'
Group by category,sub_category,Year
Order by category,sub_category,Year;

-- Machine in Technology profit decreasing inspite the sales increasing going down to product level
select Year,category,sub_category,product_name,sum(quantity) as Total_Quantity, 
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
avg(discount) as average_discount,
sum(profit)/sum(sales) * 100 as Profit_Margin
from FactOrders f
join DimDate d
on f.order_date = d.FullDate
join  DimProduct p
on f.product_id = p.product_id
where segment = 'Corporate' and (category = 'Technology' and sub_category = 'Machines') and Year in (2014)
Group by category,sub_category,product_name,Year
Having sum(profit)/sum(sales) * 100 < 0
Order by category,sub_category,product_name,Year;


-- Which category has highest sale,order and profit

select category,sum(sales) as Total_Sales,sum(quantity) as Total_Quantity,sum(profit) as Total_Profit
from FactOrders f
join DimProduct p
on f.product_id = p.product_id
Group by category;

-- Drill to office supplies 
select category,sub_category,sum(sales) as Total_Sales,sum(quantity) as Total_Quantity,sum(profit) as Total_Profit
from FactOrders f
join DimProduct p
on f.product_id = p.product_id
Group by sub_category,category
Having category = 'Office Supplies'
order by Total_Sales DESC;

-- Drill down to Technology
select category,sub_category,sum(sales) as Total_Sales,sum(quantity) as Total_Quantity,sum(profit) as Total_Profit
from FactOrders f
join DimProduct p
on f.product_id = p.product_id
Group by sub_category,category
Having category = 'Technology'
order by Total_Sales DESC;

-- Drill down to Furniture
select category,sub_category,sum(sales) as Total_Sales,
sum(quantity) as Total_Quantity,
sum(profit) as Total_Profit,
avg(discount) as average_discount
from FactOrders f
join DimProduct p
on f.product_id = p.product_id
Group by sub_category,category
Having category = 'Furniture'
order by Total_Sales DESC;

-- Looking at Different Year of Tables
select category,sub_category,sum(sales) as Total_Sales,
sum(quantity) as Total_Quantity,
sum(profit) as Total_Profit,
avg(discount) as average_discount,Year
from FactOrders f
join DimProduct p
on f.product_id = p.product_id
join DimDate D
on f.order_date = d.FullDate
Group by Year,sub_category,category
Having category = 'Furniture' and sub_category = 'Tables'
order by Year;


-- Looking at Region, looking sales, quantity
select region,
sum(quantity) as Total_Quantity,
sum(sales) as Total_Sales,
sum(profit) as Total_Profit
from DimLocation l
join FactOrders f
on l.LocationKey  = f.LocationKey
group by region
;

-- Looking at country of North
select region,country,
sum(quantity) as Total_Quantity,
sum(sales) as Total_Sales,
sum(profit) as Total_Profit
from DimLocation l
join FactOrders f
on l.LocationKey  = f.LocationKey
group by region,country
having region = 'North'
;

-- Looking at United Kingdom Category 
select region,country,category,
sum(quantity) as Total_Quantity,
sum(sales) as Total_Sales,
sum(profit) as Total_Profit
from DimLocation l
join FactOrders f
on l.LocationKey  = f.LocationKey
join DimProduct p
on f.product_id = p.product_id
group by region,country,category
having country = 'United Kingdom'
;

-- which subcategory generates most in United Kingdom in Technology
select region,country,category,sub_category,
sum(quantity) as Total_Quantity,
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
avg(discount) as AvgDiscount
from DimLocation l
join FactOrders f
on l.LocationKey  = f.LocationKey
join DimProduct p
on f.product_id = p.product_id
group by region,country,category,sub_category
having  country = 'United Kingdom' and category = 'Technology'
;

-- Looking at mexico
select region,country,category,
sum(quantity) as Total_Quantity,
sum(sales) as Total_Sales,
sum(profit) as Total_Profit
from DimLocation l
join FactOrders f
on l.LocationKey  = f.LocationKey
join DimProduct p
on f.product_id = p.product_id
group by region,country,category
having country = 'Mexico'
;

-- which sub category is driving demand in office supplies
select country,category,sub_category,
sum(quantity) as Total_Quantity,
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
rank()over( order by sum(quantity) desc) as Quantity_Ranked,
rank()over( order by sum(profit) desc) as Most_Profit,
sum(sales)/sum(quantity) as Sales_Per_Unit,
avg(discount) as average_discount
from DimLocation l
join FactOrders f
on l.LocationKey  = f.LocationKey
join DimProduct p
on f.product_id = p.product_id
group by country,category,sub_category
having country = 'Mexico' and category = 'Office Supplies';

-- looking at Product Name in Sub_Category Appliances
with mexico_office_appliances
as (
select country,sub_category,product_name,
sum(quantity) as Total_Quantity,
sum(sales) as Total_Sales,
sum(profit) as Total_Profit,
rank()over( order by sum(sales) desc) as Quantity_Ranked,
rank()over( order by sum(profit) desc) as Most_Profit,
sum(sales)/sum(quantity) as Sales_Per_Unit,
avg(discount) as average_discount
from DimLocation l
join FactOrders f
on l.LocationKey  = f.LocationKey
join DimProduct p
on f.product_id = p.product_id
group by country,sub_category,product_name
having country = 'Mexico' and sub_category = 'Appliances'
)
select * 
from mexico_office_appliances
where Sales_Per_Unit > 168
order by Total_Profit DESC;


-- Are a small number of Appliances products responsible for most of Mexico's Profit
select sum(Total_Profit) as Total_Profit_of_5
from
	(select p.product_name,l.country,p.sub_category,sum(profit) as Total_Profit
	from FactOrders o
	join DimProduct p
	on o.product_id = p.product_id
	join DimLocation l
	on l.LocationKey = o.LocationKey
	group by p.product_name,p.sub_category,l.country
	Having country = 'Mexico' and sub_category = 'Appliances'
) a
where Total_Profit >=888
;

select sum(Total_Profit) as Total_Profit_of_5
from
	(select p.product_name,l.country,p.sub_category,sum(profit) as Total_Profit
	from FactOrders o
	join DimProduct p
	on o.product_id = p.product_id
	join DimLocation l
	on l.LocationKey = o.LocationKey
	group by p.product_name,p.sub_category,l.country
	Having country = 'Mexico' and sub_category = 'Appliances'
) a
where Total_Profit <=888
;