-- Join 1: Observation + Country
select  o.Observation_ID, c.Country_Name,o.Year,o.Value
from Observation o join Country c 
on o.C_ID = c.Country_ID

-- Join 2: Observation + Indicator
select o.Observation_ID,i.Indicator_Name,i.Description,o.Year,o.Value
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID

-- Join 3: Observation + Source (through Indicator)
select o.Observation_ID,s.source_name,i.Indicator_Name,o.Year,o.Value
from Observation o
join Indicator i on o.I_ID = i.Indicator_ID
join Source s on i.S_ID = s.source_id

-- Join 4: Country + Indicator (through Observation)
select c.Country_Name,i.Indicator_Name,o.Year,o.Value
from Country c
join Observation o      on c.Country_ID = o.C_ID
join Indicator i        on o.I_ID = i.Indicator_ID

-- Join 5: Country + Indicator + Source + Observation
select c.Country_Name,i.Indicator_Name,i.Unit,s.source_name,o.Year,o.Value
from Observation o
join Country c on o.C_ID = c.Country_ID
join Indicator i on o.I_ID = i.Indicator_ID
join Source s on i.S_ID = s.source_id
