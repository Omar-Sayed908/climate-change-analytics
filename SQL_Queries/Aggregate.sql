-- Query 1: Total CO2 emissions per country
select c.Country_Name, sum(o.Value) as Total_CO2
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name = 'Annual CO2 Emissions'
group by c.Country_Name

-- Query 2: Average CO2 emissions per country
select c.Country_Name, avg(o.Value) as Avg_CO2
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name = 'Annual CO2 Emissions'
group by c.Country_Name

-- Query 3: Max mortality rate per country
select c.Country_Name, max(o.Value) as Max_Mortality
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name like '%Mortality%'
group by c.Country_Name

-- Query 4: Min mortality rate per country
select c.Country_Name, min(o.Value) as Min_Mortality
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name like '%Mortality%'
group by c.Country_Name

-- Query 5: Count number of indicators per category
select Category, COUNT(*) as Indicators_Count
from Indicator
group by Category

-- Query 6: Average water access per region
select c.Region, AVG(o.Value) as Avg_Water_Access
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name = 'Access to Safe Drinking Water'
group by c.Region

-- Query 7: Total number of observations per year
select o.Year, COUNT(*) as Obs_Count
from Observation o
group by o.Year
order by o.Year

-- Query 8: Average child stunting by region
select c.Region, avg(o.Value) as Avg_Stunting
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name = 'Child Stunting (Under 5 Years)'
group by c.Region

-- Query 9: CO2 emissions trend per year (global)
select o.Year, sum(o.Value) as Global_CO2
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
where i.Category = 'Co2'
group by o.Year

-- Query 10: Average BMI for children under 5 by country
select c.Country_Name, avg(o.Value) as Avg_BMI
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name = 'Mean BMI (Under 5 Years)'
group by c.Country_Name
