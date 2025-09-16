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
│ ├── Covid_19_PythonScript.py("data_processing")
│ ├── Covid_19_SqlScript.sql("sql_queries")
├── visualizations/
│ ├── Covid_19_Dashboard.pbix
│ ├── dashboard_screenshot.png
├── README.md
├── requirements.txt
└── project_report.md
```````


## How to Run

1. **Clone the repository:**
    ```
    git clone https://github.com/[SagarParmar101]/COVID-19-Data-Analysis-Visualization-Project.git
    cd COVID-19-Data-Analysis-Visualization-Project
    ```

2. **Install Python requirements:**
    ```
    pip install -r requirements.txt
    ```
3. **Run data processing script:**
    ```
    python scripts/Covid_19_PythonScript.py
    ```
4. **Run database setup & key SQL queries** using `scripts/Covid_19_SqlScript.sql`.
5. **Open `Covid_19_Dashboard.pbix` in Power BI Desktop** for full dashboard interactivity.

## Key Findings

- The US and India had the highest cumulative confirmed cases.
- Case Fatality Rate (CFR) dropped significantly as the pandemic evolved.
- Major case/death peaks were visually identified by year and region.
- 7-day rolling averages and growth rates revealed temporal and geographic trends.
- Interactive dashboard enables country/time filtering and rapid benchmarking.

## Dashboard Preview

![Dashboard Screenshot](https://github.com/SagarParmar101/COVID-19-Data-Analysis-Visualization-Project/blob/13abbe340614bda62bc7c11d2fd2f5c9616447fe/Covid19_DashboardScreenshot.PNG)

## Technologies Used

- PyCharm (`pandas`, `numpy`, `matplotlib`)
- SQL (MySQL/SQLite analytics)
- Power BI (visualizations, DAX)
- Git/GitHub (version control & collaboration)

## Acknowledgments

- [Johns Hopkins University CSSE COVID-19 Data](https://github.com/CSSEGISandData/COVID-19), [license](https://github.com/CSSEGISandData/COVID-19/blob/master/LICENSE)
- See `project_report.md` for additional references and insights.

## 📧 Contact

Connect with me for questions about this project or collaboration opportunities:
- **LinkedIn**: [www.linkedin.com/in/sagar-parmar2025]
- **Portfolio**: [https://sagarparmar101.github.io/]

---
