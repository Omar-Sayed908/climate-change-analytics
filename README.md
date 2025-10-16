# 🌍 Climate Analytics Dashboard – Data Analyst Project

## 📘 Project Overview
The **Climate Analytics Dashboard** provides insights into global and national environmental indicators such as CO₂ emissions, water quality, and energy consumption.  
It aims to reveal how human activities and climate-related factors correlate with sustainable development metrics like clean water access and renewable energy adoption.

---

## 🎯 Objectives
- Analyze historical **CO₂ emissions** and **energy consumption** trends.
- Evaluate **water quality** and **access to safe drinking water** globally.
- Identify **correlations** between emissions, water quality, and urbanization.
- Highlight **climate-driven risks** using a set of integrated KPIs.
- Present findings using clear, interactive, and meaningful **visual dashboards**.

---

## 🧩 Datasets

| Dataset | Description | Example Source |
|----------|--------------|----------------|
| **Total CO₂ Emissions (Cumulative)** | Cumulative national CO₂ emissions over time. | [OWID](https://data360.worldbank.org/en/indicator/OWID_CB_CUMULATIVE_CO2_INCLUDING_LUC) |
| **Annual CO₂ Emissions** | Yearly CO₂ emissions per country. | [OWID](https://data360.worldbank.org/en/indicator/OWID_CB_CONSUMPTION_CO2_PER_CAPITA) |
| **Land-Use Change CO₂ Emissions** | CO₂ from deforestation and land-use changes. | [OWID](https://data360.worldbank.org/en/indicator/OWID_CB_LAND_USE_CHANGE_CO2) |
| **CO₂ Emissions per Unit (Intensity)** | CO₂ emitted per unit of energy or GDP. | [OWID](https://data360.worldbank.org/en/indicator/OWID_CB_CO2_INCLUDING_LUC_PER_UNIT_ENERGY) |
| **Water Quality Index** | Measures water suitability for use. | [WB](https://data360.worldbank.org/en/indicator/WB_CLEAR_WATQ_NS) |
| **Access to Safe Drinking Water** | Share of population with safe water access. | [WHO](https://data360.worldbank.org/en/indicator/WB_CLEAR_JMP_DW_SFMS) |
| **Urban Population Share** | Population living in urban areas (%). | [WB](https://data360.worldbank.org/en/indicator/WB_CLEAR_SP_URB_TOTL_IN_ZS) |
| **Anemia in Aged Women** | Pregnant women with anemia (%). | [GHO](https://data360.worldbank.org/en/indicator/WHO_GHO_NUTRITION_ANAEMIA_PREGNANT_PREV) |
| **Child Stunting (Under 5 Years)** | Children under 5 with low height for age. | [UNICEF](https://data360.worldbank.org/en/indicator/UNICEF_DW_NT_ANT_HAZ_NE2) |
| **Child Wasting (Under 5 Years)** | Children under 5 with low weight for height. | [WDI](https://data360.worldbank.org/en/indicator/WB_WDI_SH_STA_WAST_ZS) |
| **Under-5 Mortality Rate** | Deaths under age 5 per 1,000 births. | [WB_WDI](https://data360.worldbank.org/en/indicator/WB_WDI_SH_DYN_MORT) |
| **Mean BMI (Under 5 Years)** | Average BMI of children under 5. | [UNICEF_WB](https://data360.worldbank.org/en/indicator/UNICEF_DW_NT_ANT_BAZ_AVG) |

---

## 📊 Key Performance Indicators (KPIs)

### 🌫️ Emissions & Energy
| # | KPI | Description | Visualization |
|---|------|-------------|---------------|
| 1 | **Total CO₂ Emissions (Cumulative)** | Total emissions across all years or countries | 🧮 Big Number Card / Line Chart |
| 2 | **Annual CO₂ Emissions** | Yearly emission values for trend analysis | 📈 Line Chart |
| 3 | **Land-Use Change CO₂ Emissions** | Emissions from deforestation and land clearing | 🌾 Stacked Area Chart |
| 4 | **CO₂ Emissions per Unit (Intensity)** | Emissions relative to GDP or energy use | ⚙️ Bar Chart / Scatter Plot |
| 5 | **Energy Consumption per Capita** | Energy use per person over time | 🔋 Bar Chart / Line Chart |
| 6 | **Renewable Energy Share (%)** | Renewable energy as a % of total consumption | 🌞 Donut Chart / Stacked Bar |

---

### 💧 Water & Access
| # | KPI | Description | Visualization |
|---|------|-------------|---------------|
| 7 | **Water Quality Index** | Composite indicator of water cleanliness | 💧 Gauge Chart / Heatmap |
| 8 | **Access to Safe Drinking Water** | % of population with safe water | 🗺️ Map Chart / Bar Chart |
| 9 | **Access to Safe Water – Urban Areas** | Safe water in urban vs rural areas | 🏙️ Grouped Bar Chart |
| 10 | **Water Quality Trend (Yearly)** | Yearly changes in water quality | 📈 Line Chart |
| 14 | **Water Stress Index** | Ratio of water use to available supply | 💦 Gauge / Heatmap |

---

### 🧠 Correlation & Impact Analysis
| # | KPI | Description | Visualization |
|---|------|-------------|---------------|
| 11 | **CO₂ vs Water Quality** | Relationship between emissions and water quality | 🔘 Scatter Plot |
| 12 | **CO₂ vs Safe Water Access** | Impact of pollution on water access | 🟣 Bubble Chart |
| 13 | **Water Quality vs Health Indicators** | Water quality’s effect on anemia, stunting, etc. | 🧬 Scatter Plot |
| 16 | **Deforestation-related CO₂ Share** | % of emissions due to forest loss | 🌲 Stacked Area Chart |
| 17 | **Average Temperature Anomaly** | Global temp deviation from baseline | 🌡️ Line Chart / Heatmap Calendar |
| 18 | **Climate-Linked Risk Index** | Composite metric summarizing climate risk | 🧭 Radar Chart / Card |

---

## ⚙️ Tools & Technologies
- **Data Loading:** SSIS
- **Data Cleaning & Analysis:** Excel
- **Dashboard:** Streamlit / Power BI / Tableau
- **Data Sources:** WHO, World Bank, Our World in Data
- **Version Control:** Git & GitHub

---

## 🚀 Next Steps
1. Collect and preprocess all datasets (handle nulls, units, and time alignment).
2. Perform **Exploratory Data Analysis (EDA)**.
3. Compute correlations and construct composite indices.
4. Design and deploy **interactive climate dashboard**.
5. Publish insights and recommendations.

---

## 📈 Potential Insights
- Identify countries contributing most to **emissions per capita**.
- Observe link between **CO₂ trends** and **water quality deterioration**.
- Detect **climate inequalities** in access to safe water.
- Highlight **renewable growth potential** in high-emission regions.

---

## 🧾 References
- [Our World in Data – CO₂ & Energy](https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions)

---

**Author:** *DEPI Team 2025*  
**Role:** Data Analyst  
**Focus:** Climate and Environmental Data Analytics 🌿
