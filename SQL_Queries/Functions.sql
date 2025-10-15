-----------Aly
--------------1 (Descirptive Func)
CREATE FUNCTION Co2_Trend_ByCountry (@Country_ID int)
RETURNS TABLE
AS
RETURN
( Select Country_Name, Year, SUM(Value) AS TotalEmissions
from Indicator, Observation, Country
WHERE Country_ID = @Country_ID
AND Indicator_Name IN('Total CO2 Emissions (Cumulative)')
Group by Country_Name, Year
)

select * 
from Co2_Trend_ByCountry(1)

-------------------2 (Diagnostic Func)
CREATE FUNCTION Water_Vs_Health (@Country_ID int)
RETURNS TABLE
AS
RETURN
( select Country_Name, Year, Indicator_Name, Value
from Indicator, Observation, Country
WHERE Country_ID = @Country_ID
AND Indicator_Name IN ('Under-5 Mortality Rate', 'Water Quality Index')
)

select * 
from Water_Vs_Health(1)

---------------------------------3 (Regional Diagnostic Function)
CREATE FUNCTION Regional_Stress(@Region nvarchar (100))
RETURNS TABLE
AS
RETURN
(select Region, Year,
        AVG(CASE WHEN Indicator_Name = 'Total CO2 Emissions (Cumulative)' THEN Value END) AS AvgCO2,
        AVG(CASE WHEN Indicator_Name = 'Water Quality Index' THEN Value END) AS AvgWater,
        AVG(CASE WHEN Indicator_Name = 'Under-5 Mortality Rate' THEN Value  END) AS AvgMortality
from Country, Indicator, Observation
WHERE Region = @Region
Group by Region, Year
)

select *
from  Regional_Stress('MiddleEast')

-----------------------------------Aya
----------------------------4(Predictive Function)
CREATE FUNCTION CO2_Predict2030(@Country_ID int)
RETURNS TABLE
AS
RETURN
(select TOP 1
        MAX(Year) + 7 AS ForecastYear,
		AVG(Value) + (AVG(Value) *0.15) AS Predicted_CO2
from Country, Indicator, Observation
WHERE Country_ID = @Country_ID
AND Indicator_Name IN ('Annual CO2 Emissions')
)

select * 
from CO2_Predict2030(1)


-------------------------------5 (Composite Function)
CREATE FUNCTION Vulnerability_Index ()
RETURNS TABLE
AS
RETURN
( select Country_Name,
         AVG(Value) AS AVGCO2,
		 AVG(Value) AS AVGWaterAccess,
		 AVG(Value) AS AVGMortality,
		 (AVG(Value) * 0.4 
            - AVG(Value) * 0.3 
            + AVG(Value) * 0.3) AS VulnerabilityScore
from Country, Indicator, Observation
WHERE Indicator_Name IN ('Total CO2 Emissions (Cumulative)', 'Access to Safe Drinking Water', 'Under-5 Mortality Rate')
Group by Country_Name
)

select *
from Vulnerability_Index()