# COVID-19 Data Analysis – Project Report

## 1. Project Overview

This portfolio project investigates the dynamics of the COVID-19 pandemic globally using the most reliable open datasets. The end-to-end process includes data acquisition, cleaning, KPI calculation, SQL analytics, and business dashboarding in Power BI.

## 2. Goals

- Build a reproducible data pipeline demonstrating data engineering and analytics capability.
- Surface actionable insights around pandemic timelines, global impact, and country-level trends.
- Demonstrate technical skills in Python (pandas/NumPy), SQL, and Power BI visualization.

## 3. Data Sources

- Johns Hopkins University CSSE COVID-19 time series ([Repo link](https://github.com/CSSEGISandData/COVID-19))
  - Confirmed cases, deaths (CSV, updated daily)
- Data was accessed directly via Python scripts and maintained in CSV/SQL formats.

## 4. Data Processing & Cleaning

- Downloaded latest time series via pandas.
- Converted wide to long format for daily analysis.
- Filled missing state values, standardized column types.
- **Special cleaning steps:**  
    - Replaced `inf` and `-inf` in KPI columns with zero.
    - Ensured all blank/empty string cells were truly blank (not just spaces), for smooth SQL import.

## 5. Feature Engineering & KPI Computation

- Calculated:
    - **Daily New Cases** by country (difference from prior day)
    - **7-Day Rolling Average** for smoothing trends
    - **Case Fatality Rate (CFR)** for all dates/countries
    - **Growth Rate** (daily % increase)
- Used groupby, rolling window, and column math in pandas.

## 6. Database Integration & SQL Analysis

- Imported tidy data into SQL database for further KPI queries.
- Wrote key queries to surface top countries, daily global stats, and window-function-based comparisons.

## 7. Power BI Dashboard

- Visualized KPIs, temporal trends, and global distribution.
- Interactive elements allow filtering by country, date, and KPI.
- Dashboard screenshot and `.pbix` file included in `visualizations/`.

## 8. Key Insights

- Top 3 countries (US, India, Brazil) accounted for nearly half of all global cases.
- CFR trended down over time—likely due to improved treatment/vaccination.
- Peak pandemic periods easily visible at both global and regional scales.
- Insights are intended to support health analytics, resource allocation, and retrospective public health study.

## 9. Challenges

- Data format inconsistencies (esp. blank or 'inf' cells) required advanced cleaning.
- Wide-to-long transformation and KPI calculation across many countries was slow for large datasets.
- Ensuring dashboard readability while preserving detail in Power BI.

## 10. References

- Johns Hopkins COVID-19 [Dataset & License](https://github.com/CSSEGISandData/COVID-19/blob/master/LICENSE)
- Related projects, blogs, and published dashboards (see README for links).

---

*Prepared by [SagarParmar](https://github.com/SagarParmar101),2025.*
