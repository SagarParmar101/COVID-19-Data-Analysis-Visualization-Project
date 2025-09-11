# Required libraries
import pandas as pd
import numpy as np

# 1. Download data directly from GitHub
confirmed_url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
deaths_url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

# 2. Data Loading
confirmed_df = pd.read_csv(confirmed_url)
deaths_df = pd.read_csv(deaths_url)

# 3. Data Cleaning
confirmed_df['Province/State'] = confirmed_df['Province/State'].fillna('')
deaths_df['Province/State'] = deaths_df['Province/State'].fillna('')

# 4. Data Transformation: Wide to Long format (MELT)
confirmed_melted = confirmed_df.melt(
    id_vars=['Province/State', 'Country/Region', 'Lat', 'Long'],
    var_name='Date',
    value_name='Confirmed'
)
deaths_melted = deaths_df.melt(
    id_vars=['Province/State', 'Country/Region', 'Lat', 'Long'],
    var_name='Date',
    value_name='Deaths'
)

# 5. Date parsing
date_format = '%m/%d/%y'
confirmed_melted['Date'] = pd.to_datetime(confirmed_melted['Date'], format=date_format)
deaths_melted['Date'] = pd.to_datetime(deaths_melted['Date'], format=date_format)

# 6. Merge datasets into one DataFrame
covid_data = confirmed_melted.merge(
    deaths_melted,
    on=['Province/State', 'Country/Region', 'Lat', 'Long', 'Date'],
    how='left'
)

# 7. Calculate KPIs (Daily New Cases, CFR, 7-Day Avg)
def calculate_kpis(df):
    df['Daily_New_Cases'] = df.groupby('Country/Region')['Confirmed'].diff()
    df['Case_Fatality_Rate'] = (df['Deaths'] / df['Confirmed'] * 100).round(2)
    df['7_Day_Avg'] = df.groupby('Country/Region')['Daily_New_Cases'].transform(
        lambda x: x.rolling(7).mean()
    )
    return df

covid_data = calculate_kpis(covid_data)

# 8. Calculate Growth Rate for all countries and ALL rows
covid_data['Growth_Rate'] = covid_data.groupby('Country/Region')['Confirmed'].pct_change() * 100

# ----> EXTRA DATA CLEANING STEP (before exporting)

# Replace any 'inf', '-inf', or np.inf/-np.inf with 0 in Case_Fatality_Rate and Growth_Rate
for col in ['Case_Fatality_Rate', 'Growth_Rate']:
    covid_data[col] = pd.to_numeric(covid_data[col], errors='coerce')  # convert to float, turns 'inf' to np.inf/NaN
    covid_data[col] = covid_data[col].replace([np.inf, -np.inf], 0).fillna(0)  # set inf/-inf/NaN to zero

# Remove any lone spaces in ALL string/object columns (ensuring blanks are truly empty)
for col in covid_data.select_dtypes(include='object').columns:
    covid_data[col] = covid_data[col].replace(r'^\s*$', '', regex=True)
    covid_data[col] = covid_data[col].str.strip()


# 9. QUICK CHECK: See some data and columns
print(covid_data.head(20))
print(list(covid_data.columns))

# 10. Export final, complete data (with Growth_Rate!) to CSV file
covid_data.to_csv('covid_data_full.csv', index=False)

# 11. (Optional) Country-specific growth (still possible if needed)
def growth_rate_analysis(df, country):
    country_data = df[df['Country/Region'] == country].copy()
    country_data['Growth_Rate'] = country_data['Confirmed'].pct_change() * 100
    return country_data
