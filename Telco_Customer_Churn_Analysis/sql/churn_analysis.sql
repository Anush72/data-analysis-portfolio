# Telo Dataset

# Looking at random 10 dataset
select *
from telcochurn
order by rand()
limit 10;


# Looking at Total Number of Customers
select count(*) as TotalCustomers
from telcochurn;

# Look at Total Number of Churn Customer and Who do not churn
select churnlabel, count(*) as TotalCustomers
from telcochurn
group by ChurnLabel;

# Looking at Total Customers distribution by Internet Services
select InternetService,count(*) as TotalCustomers
from telcochurn
group by InternetService;

# Looking at Total Customers distribution by Internet Services look at both churn and no churn
select InternetService,ChurnLabel,count(*) as TotalCustomers
from telcochurn
group by InternetService,ChurnLabel;

# Looking at Churn Rate by internetService;
select InternetService,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by InternetService;
# Looking at churn rate by Senior Citizen
select SeniorCitizen,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by SeniorCitizen;

# Churn Rate by Partner
select Partner,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by Partner;

# Churn Rate by Depedents
select Dependents,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by Dependents;

# Churn Rate by Gender
select Gender,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by Gender;

# Top 10 City where Customer Live
select city,count(*) as TotalCustomers
from telcochurn
group by city
order by TotalCustomers DESC
Limit 10;

# Churn Rate by location
select city,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by city
order by ChurnedCustomers desc
LIMIT 10;

# Customer Distrbution by Contract Type
select Contract, count(*) as Total_Customers
from telcochurn
group by Contract;

# Churn Rate by Contract Type
select Contract,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by Contract;

# Looking at Top 10 Reasons for churn
select ChurnReason, count(*) as Total
from telcochurn
where ChurnReason <> ''
group by ChurnReason
Order by Total desc Limit 10;

# Look at number of high value and high risk customer
select Count(*) as Total_HighValue_HighRisk
from telcochurn
where ChurnRisk = 'High Risk' and CustomerValue = 'High Value';

# Look at total revenue
select round(sum(TotalCharges),2) as Total_Revenue
from telcochurn;

# Look at Total revenue at risk
select round(sum(TotalCharges),2) as Total_Revenue
from telcochurn
where ChurnLabel = 'No' and (ChurnRisk = 'High Risk' and CustomerValue = 'High Value');

# Look at Revenue lost
select round(sum(TotalCharges),2) as Total_Revenue
from telcochurn
where ChurnLabel = 'Yes';

# Look at Monthly Charges per internet services
select InternetService,avg(MonthlyCharges) as Average_Charge
from telcochurn
group by InternetService;

# Look at ChurnRate by TenureYears
select TenureYears,
SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end) as ChurnedCustomers,
round(SUM(case when ChurnLabel = 'Yes' then 1
	else 0 end)/count(*) * 100,2)
as ChurnRate
from telcochurn
group by TenureYears;