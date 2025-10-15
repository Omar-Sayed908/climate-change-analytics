
create procedure countries_info
as 
begin
	
	select c.Country_Name , c.Region , i.Category , i.Indicator_Name , o.Value , o.Year
	from Country c , Indicator i , Observation o
	where c.Country_ID = o.C_ID and i.Indicator_ID = o.I_ID
	order by c.Country_Name

end

exec countries_info