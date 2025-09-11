# COVID-19 Data Analysis & Visualization Project

## Table of Contents
- [Overview](#overview)
- [Data Sources](#data-sources)
- [Project Structure](#project-structure)
- [How to Run](#how-to-run)
- [Key Findings](#key-findings)
- [Dashboard Preview](#dashboard-preview)
- [Technologies Used](#technologies-used)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Overview
A comprehensive analysis of the global COVID-19 pandemic using **Python**, **SQL**, and **Power BI**.  
This project demonstrates sourcing, cleaning, transformation, KPI creation, database integration, and dashboard visualization. Suitable for portfolio or professional analytics applications.

## Data Sources
- [Johns Hopkins University CSSE COVID-19 Data Repository](https://github.com/CSSEGISandData/COVID-19)
  - [Global Confirmed Cases CSV](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series)
  - [Global Deaths CSV](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series)

## Project Structure
````
covid19-data-analysis/
├── data/
│ ├── raw_data/
│ ├── processed_data/
├── scripts/
│ ├── data_processing.py
│ ├── sql_queries.sql
├── visualizations/
│ ├── covid_dashboard.pbix
│ ├── dashboard_screenshot.png
├── README.md
├── requirements.txt
└── project_report.md
```````


## How to Run

1. **Clone the repository:**
    ```
    git clone https://github.com/[yourusername]/covid19-data-analysis.git
    cd covid19-data-analysis
    ```

2. **Install Python requirements:**
    ```
    pip install -r requirements.txt
    ```
3. **Run data processing script:**
    ```
    python scripts/data_processing.py
    ```
4. **Run database setup & key SQL queries** using `scripts/sql_queries.sql`.
5. **Open `covid_dashboard.pbix` in Power BI Desktop** for full dashboard interactivity.

## Key Findings

- The US and India had the highest cumulative confirmed cases.
- Case Fatality Rate (CFR) dropped significantly as the pandemic evolved.
- Major case/death peaks were visually identified by year and region.
- 7-day rolling averages and growth rates revealed temporal and geographic trends.
- Interactive dashboard enables country/time filtering and rapid benchmarking.

## Dashboard Preview

![Dashboard Screenshot](visualizations/dashboard_screenshot.png)

## Technologies Used

- Python 3 (`pandas`, `numpy`, `matplotlib`)
- SQL (MySQL/SQLite analytics)
- Power BI (visualizations, DAX)
- Jupyter Notebook (optional for EDA)
- Git/GitHub (version control & collaboration)

## Acknowledgments

- [Johns Hopkins University CSSE COVID-19 Data](https://github.com/CSSEGISandData/COVID-19), [license](https://github.com/CSSEGISandData/COVID-19/blob/master/LICENSE)
- Power BI dashboard inspiration: [JHU dashboard](https://coronavirus.jhu.edu/map.html), [PowerBI community](https://community.powerbi.com/)
- See `project_report.md` for additional references and insights.

