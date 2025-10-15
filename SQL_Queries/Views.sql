-- View 1: Average CO2 emissions per country across years
create view Avg_CO2_ByCountry
as

select c.Country_Name,avg(o.Value) as Avg_CO2_Emissions
from Observation o
join Indicator i             on  o.I_ID = i.Indicator_ID
join Country c               on o.C_ID = c.Country_ID
where i.Indicator_Name = 'Annual CO2 Emissions'
group by c.Country_Name

-- View 2: Safe water access percentage per country
CREATE VIEW WaterAccess as

select c.Country_Name,o.Year,o.Value as Water_Access_Percentage
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID

where i.Indicator_Name = 'Access to Safe Drinking Water';

-- View 3: Child mortality trend per country
CREATE VIEW ChildMortality as

select c.Country_Name,o.Year,o.Value as Under5_Mortality
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID
where i.Indicator_Name = 'Under-5 Mortality Rate';

-- View 4: Observations with Indicator details
CREATE VIEW ObservationDetails 

as

select o.Observation_ID,c.Country_Name,i.Indicator_Name,i.Unit,o.Year,o.Value
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Country c on o.C_ID = c.Country_ID;