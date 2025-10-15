------------INDEX-----------------------------------
-- index 1:
create index idx_country_iso
on country(iso_code)

-- index 2:
create index idx_observation_indicator
on observation(i_id)

-- index 3:
create index idx_country_year
on observation(c_id, year)


--------Update Statment----------------------------
update indicator
set unit = 'tonnes_co2'
where indicator_name like '%CO2%'



