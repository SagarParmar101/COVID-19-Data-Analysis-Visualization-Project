-- Create tables from the processed CSV files
CREATE OR REPLACE TABLE daily AS SELECT * FROM read_csv_auto('data/processed/covid_country_daily.csv', sample_size=-1);
CREATE OR REPLACE TABLE summary AS SELECT * FROM read_csv_auto('data/processed/covid_country_summary.csv', sample_size=-1);

-- 1. Sanity check: world totals (JHU final figures are about 676.6 million cases and 6.88 million deaths)
SELECT SUM(confirmed) AS world_cases, SUM(deaths) AS world_deaths,
       ROUND(SUM(deaths) * 100.0 / SUM(confirmed), 2) AS world_cfr_pct
FROM summary;

-- 2. Top 10 countries by total cases, with share of the world total
SELECT country, confirmed AS total_cases, deaths AS total_deaths, cfr_pct,
       ROUND(confirmed * 100.0 / SUM(confirmed) OVER (), 1) AS share_of_world_pct
FROM summary
ORDER BY confirmed DESC
LIMIT 10;

-- 3. Top 10 countries by cases per million (only countries with 1 million+ people)
SELECT country, ROUND(cases_per_million) AS cases_per_million,
       ROUND(deaths_per_million) AS deaths_per_million, cfr_pct
FROM summary
WHERE population >= 1000000
ORDER BY cases_per_million DESC
LIMIT 10;

-- 4. How the ranking changes after adjusting for population (countries with 1 million+ people)
SELECT country, confirmed AS total_cases,
       RANK() OVER (ORDER BY confirmed DESC) AS rank_total_cases,
       RANK() OVER (ORDER BY cases_per_million DESC) AS rank_per_million
FROM summary
WHERE population >= 1000000
ORDER BY rank_total_cases
LIMIT 10;

-- 5. Each country's worst month for new cases, then count countries per month
WITH monthly AS (
    SELECT country, date_trunc('month', date) AS month_start, SUM(new_cases) AS cases
    FROM daily
    GROUP BY country, month_start
), ranked AS (
    SELECT country, month_start, cases,
           ROW_NUMBER() OVER (PARTITION BY country ORDER BY cases DESC) AS rn
    FROM monthly
)
SELECT month_start AS worst_month, COUNT(*) AS countries
FROM ranked
WHERE rn = 1
GROUP BY month_start
ORDER BY countries DESC
LIMIT 5;

-- 6. Global fatality rate by year (deaths in the year divided by cases in the year)
SELECT EXTRACT(YEAR FROM date) AS yr, SUM(new_cases) AS cases, SUM(new_deaths) AS deaths,
       ROUND(SUM(new_deaths) * 100.0 / SUM(new_cases), 2) AS cfr_pct
FROM daily
GROUP BY yr
ORDER BY yr;

-- 7. Cross-check: 7-day average calculated in SQL vs the Python column (difference should be below 0.01)
WITH w AS (
    SELECT country, date,
           AVG(new_cases) OVER (PARTITION BY country ORDER BY date
                                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS sql_7d_avg,
           cases_7d_avg AS python_7d_avg
    FROM daily
)
SELECT MAX(ABS(sql_7d_avg - python_7d_avg)) AS max_difference
FROM w
WHERE python_7d_avg IS NOT NULL;
