# 🚦 Road Accident Analysis (SQL)

## 📌 Project Overview
This project provides a **comprehensive SQL-based analysis** of road accident data to identify patterns, trends, and contributing factors to casualties and accidents.  
By analyzing accident severity, vehicle types, road conditions, and seasonal trends, the goal is to support **data-driven decision-making** for road safety improvements.

## 🎯 Objectives
- Calculate **total casualties and accidents** for the current year.
- Identify **fatal, serious, and slight casualties**.
- Analyze **casualties by vehicle type**.
- Track **monthly casualty trends**.
- Compare **casualties by road type** year-over-year.
- Identify **urban vs rural accident patterns**.
- Evaluate the **impact of light, weather, and road surface conditions**.
- Highlight **top 10 accident-prone locations**.

## 🛠 Tools & Technologies
- **SQL Server** – Data querying and analysis
- **SQL Functions** – Aggregation, grouping, conditional logic
- **CASE Statements** – Vehicle type grouping
- **Date Functions** – Year & month extraction

## 📂 Dataset
Contains fields such as:
- Accident Date & Index
- Number of Casualties
- Accident Severity
- Vehicle Type
- Road Type
- Light Conditions
- Urban/Rural Classification
- Road Surface Conditions
- Weather Conditions
- Local Authority

*(Note: Data is anonymized and sourced from road safety statistics.)*

## 📊 Key Analysis Performed
1. **Yearly Summary**
   - Total casualties & accidents in 2022
   - Breakdown by severity (fatal, serious, slight)

2. **Vehicle Type Grouping**
   - Agriculture, Car, Bike, Bus, Van, Other

3. **Monthly Trend Analysis**
   - Casualty distribution across months

4. **Road Type Comparison**
   - Current year vs previous year casualties by road type

5. **Urban vs Rural**
   - Distribution of casualties by area type

6. **Light Conditions**
   - Day vs Night accident casualties

7. **Top 10 Locations**
   - Local authorities with highest casualties

8. **Road Surface & Weather Impact**
   - Casualties by road surface condition
   - Accidents by weather condition

## 📌 Example SQL Snippets
```sql
-- Total casualties in 2022
SELECT SUM(number_of_casualties) AS CY_CASUALTIES
FROM road_accident
WHERE YEAR(accident_date) = '2022';

-- Casualties by vehicle group
SELECT 
CASE 
    WHEN vehicle_type IN ('Agriculture Vehicle') THEN 'Agriculture'
    WHEN vehicle_type IN ('Car','Taxi/Private hire car') THEN 'Car'
    WHEN vehicle_type LIKE 'Motorcycle%' OR vehicle_type = 'Pedal cycle' THEN 'Bike'
    WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') THEN 'Bus'
    WHEN vehicle_type LIKE 'Van%' OR vehicle_type LIKE 'Goods%' THEN 'Van'
    ELSE 'Other'
END AS VEHICLE_GROUP,
SUM(number_of_casualties) AS CY_CASUALTIES
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY 
CASE 
    WHEN vehicle_type IN ('Agriculture Vehicle') THEN 'Agriculture'
    WHEN vehicle_type IN ('Car','Taxi/Private hire car') THEN 'Car'
    WHEN vehicle_type LIKE 'Motorcycle%' OR vehicle_type = 'Pedal cycle' THEN 'Bike'
    WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') THEN 'Bus'
    WHEN vehicle_type LIKE 'Van%' OR vehicle_type LIKE 'Goods%' THEN 'Van'
    ELSE 'Other'
END;

## 📌 Author
**Kaliraj R**  
MBA Graduate | Data Analyst  
📧 kalirajkarthi3@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/kaliraj-r-3s)
