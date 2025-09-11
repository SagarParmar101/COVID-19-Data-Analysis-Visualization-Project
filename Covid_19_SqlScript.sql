-- Create SQLite database
CREATE TABLE covid_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    province_state VARCHAR(256),
    country_region VARCHAR(256) NOT NULL,
    lat FLOAT,
    lng FLOAT,
    date DATE NOT NULL,
    confirmed INT DEFAULT 0,
    deaths INT DEFAULT 0,
    daily_new_cases FLOAT,
    case_fatality_rate FLOAT,
    seven_day_avg FLOAT,
    growth_rate FLOAT
);

-- Loading Data into covid_data table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/covid_data_fulledited.csv'
INTO TABLE covid_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(province_state, country_region, lat, lng, date, confirmed, deaths, daily_new_cases, case_fatality_rate, seven_day_avg, growth_rate);

-- Read and Check Data
SELECT * FROM covid_data;
SELECT COUNT(*) FROM covid_data;

-- Top 10 countries by total cases
SELECT 
    country_region,
    MAX(confirmed) as total_cases,
    MAX(deaths) as total_deaths,
    ROUND(MAX(deaths) * 100.0 / MAX(confirmed), 2) as cfr
FROM covid_data 
GROUP BY country_region 
ORDER BY total_cases DESC 
LIMIT 10;

-- Daily global statistics
SELECT 
    date,
    SUM(confirmed) as global_confirmed,
    SUM(deaths) as global_deaths,
    SUM(daily_new_cases) as daily_new_global
FROM covid_data 
GROUP BY date 
ORDER BY date;

-- Country comparison with window functions
SELECT 
    country_region,
    date,
    confirmed,
    LAG(confirmed, 1) OVER (
        PARTITION BY country_region 
        ORDER BY date
    ) as previous_day_cases,
    confirmed - LAG(confirmed, 1) OVER (
        PARTITION BY country_region 
        ORDER BY date
    ) as daily_change
FROM covid_data 
WHERE country_region IN ('US', 'India', 'Brazil');
