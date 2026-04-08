# Sample Python code for transforming a date into an astronomical seasonal phase variable
# - code produced by Gemini on April 7, 2026 
# - oriented around northern hemisphere
# - for single year date ranges that are not in a leap year, change the number of days to 365
# - ensure the input column is a true datetime object using pd.to_datetime() before running the function, otherwise .dt.dayofyear will throw an error.

import pandas as pd
import numpy as np

def transform_seasonal_phase(df, date_col):
    """
    Transforms a date column into a continuous seasonal variable.
    +1 = Summer Solstice (~June 21)
    -1 = Winter Solstice (~Dec 21)
    0  = Equinoxes
    """
    
    # 1. Extract the Day of the Year (1 to 366)
    # If your dataset spans multiple years, this ignores the year 
    # and treats every "June 21" the same.
    day_of_year = df[date_col].dt.dayofyear
    
    # 2. Define the Anchor (Summer Solstice)
    # The average day of the year for the Summer Solstice is 172.
    # Adjust this value if you are working with specific leap year shifts.
    solstice_day = 172
    
    # 3. Calculate the Phase
    # We use 365.25 to account for the average length of a year.
    # The formula: cos(2 * pi * (day - anchor) / year_length)
    # This centers the peak (+1) at day 172.
    df['seasonal_phase'] = np.cos(2 * np.pi * (day_of_year - solstice_day) / 365.25)
    
    return df

# --- Example Usage ---
data = {
    'date': pd.to_datetime([
        '2024-06-21', # Summer Solstice (+1)
        '2024-12-21', # Winter Solstice (-1)
        '2024-03-20', # Spring Equinox (0)
        '2024-09-22', # Autumn Equinox (0)
        '2024-08-05'  # Mid-summer
    ])
}

df = pd.DataFrame(data)
df = transform_seasonal_phase(df, 'date')

print(df)
