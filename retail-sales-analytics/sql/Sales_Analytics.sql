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
