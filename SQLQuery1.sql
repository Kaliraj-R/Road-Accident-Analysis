SELECT * FROM road_accident;

SELECT SUM(number_of_casualties) as CY_CASUALTIES 
FROM road_accident
WHERE YEAR(accident_date)='2022';

SELECT COUNT(DISTINCT accident_index) as CY_ACCIDENTS 
FROM road_accident
WHERE YEAR(accident_date)='2022';

SELECT SUM(number_of_casualties) as CY_FATAL_CASUALTIES 
FROM road_accident
WHERE accident_severity='Fatal';

SELECT SUM(number_of_casualties) as CY_SERIOUS_CASUALTIES 
FROM road_accident
WHERE YEAR(accident_date)='2022'AND 
accident_severity='SERIOUS';

SELECT SUM(number_of_casualties) as CY_SLIGHT_CASUALTIES 
FROM road_accident
WHERE YEAR(accident_date)='2022'AND 
accident_severity='Slight';

SELECT vehicle_type FROM road_accident
group by vehicle_type;

SELECT 
CASE 
	WHEN vehicle_type in ('Agriculture Vehicle') THEN 'Agriculture'
	WHEN vehicle_type in ('Car','Taxi/Private hire car') THEN 'Car'
	WHEN vehicle_type in ('Motorcycle 50cc and under','Motorcycle over 500cc','Motorcycle over 125cc and up to 500cc',
	'Motorcycle 125cc and under','Pedal cycle') THEN 'Bike'
	WHEN vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') THEN 'Bus'
	WHEN vehicle_type in ('Van / Goods 3.5 tonnes mgw or under','Goods over 3.5t. and under 7.5t',
	'Goods 7.5 tonnes mgw and over') THEN 'Van'
	ELSE 'Other'
	END AS VEHICLE_GROUP,
	SUM(number_of_casualties) AS CY_CASUALTIES
	FROM road_accident
	WHERE YEAR(accident_date)='2022'
	GROUP BY
			CASE 
	WHEN vehicle_type in ('Agriculture Vehicle') THEN 'Agriculture'
	WHEN vehicle_type in ('Car','Taxi/Private hire car') THEN 'Car'
	WHEN vehicle_type in ('Motorcycle 50cc and under','Motorcycle over 500cc','Motorcycle over 125cc and up to 500cc',
	'Motorcycle 125cc and under','Pedal cycle') THEN 'Bike'
	WHEN vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') THEN 'Bus'
	WHEN vehicle_type in ('Van / Goods 3.5 tonnes mgw or under','Goods over 3.5t. and under 7.5t',
	'Goods 7.5 tonnes mgw and over') THEN 'Van'
	ELSE 'Other'
	END;

SELECT DATENAME(MONTH, accident_date) AS MONTH_NAME,
SUM(number_of_casualties) AS TOTAL
FROM road_accident
WHERE YEAR(accident_date)='2022'
GROUP BY DATENAME(MONTH, accident_date);

SELECT road_type AS ROAD_TYPE,
SUM(number_of_casualties) as CY_CASUALTIES 
FROM road_accident
WHERE YEAR(accident_date)='2022'
GROUP BY road_type;

SELECT road_type AS ROAD_TYPE,
SUM(number_of_casualties) as PRV_CASUALTIES 
FROM road_accident
WHERE YEAR(accident_date)='2021'
GROUP BY road_type;

SELECT urban_or_rural_area AS URBAN_OR_RURAL_AREA,
SUM(number_of_casualties) AS TOTAL_CASUALTIES
FROM road_accident
WHERE YEAR(accident_date)='2022'
GROUP BY urban_or_rural_area;

SELECT
CASE
	WHEN light_conditions IN ('Daylight') THEN 'DAY'
	WHEN light_conditions IN ('Darkness - no lighting',
	'Darkness - lights lit','Darkness - lights unlit',
	'Darkness - lighting unknown') THEN 'NIGHT'
	END AS LIGHT_CONDITION,
	SUM(number_of_casualties) AS CY_CASUALTIES
	FROM road_accident
	--WHERE YEAR(accident_date)='2022'
	GROUP BY 
		CASE
		WHEN light_conditions IN ('Daylight') THEN 'DAY'
		WHEN light_conditions IN ('Darkness - no lighting',
		'Darkness - lights lit','Darkness - lights unlit',
		'Darkness - lighting unknown') THEN 'NIGHT'
		END;

SELECT TOP 10 local_authority AS LOCAL_AUTHORITY,
SUM(number_Of_casualties) AS TOTAL_CASUALTIES
FROM road_accident
GROUP BY local_authority
ORDER BY TOTAL_CASUALTIES DESC;

SELECT COUNT(accident_index) AS TOTAL_ACCIDENT 
FROM road_accident;

SELECT DISTINCT road_surface_conditions FROM road_accident;

SELECT road_surface_conditions,
SUM(number_of_casualties) as TOTAL_CASUALTIES 
FROM road_accident
GROUP BY road_surface_conditions;

SELECT weather_conditions,
COUNT(accident_index) as TOTAL_ACCIDENT
FROM road_accident
GROUP BY weather_conditions;
