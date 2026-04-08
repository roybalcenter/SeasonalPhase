# Sample Python code for transforming a date into an astronomical seasonal phase variable
# - code produced by Gemini on April 7, 2026 
# - oriented around northern hemisphere
# - for single year date ranges that are not in a leap year, change the number of days to 365
# - ensure the input column is a true datetime object using pd.to_datetime() before running the function, otherwise .dt.dayofyear will throw an error.

import pandas as pd
import numpy as np

def calculate_seasonal_phase(df, date_col):
    """
    Transforms a date into a continuous seasonal variable (+1 to -1).
    
    Parameters:
    df (pd.DataFrame): The input dataframe.
    date_col (str): The name of the column containing datetime objects.
    """
    
    # 1. Extract the 'Day of the Year' (Julian Day)
    # This results in an integer from 1 to 366.
    # We use this to strip away the 'Year' so that June 21st is 
    # treated the same regardless of whether it's 2020 or 2024.
    day_of_year = df[date_col].dt.dayofyear
    
    # 2. Define the Seasonal Anchor
    # 172 is the average day of the year for the Summer Solstice (June 21).
    # IF ANALYZING SOUTHERN HEMISPHERE: Change this to 355 (Dec 21).
    solstice_day = 172
    
    # 3. Apply the Cosine Transformation
    # - 2 * pi converts the linear day into a circular (angular) value.
    # - (day_of_year - solstice_day) shifts the wave so the peak (+1) is at the solstice.
    # - 365.25 is used as the denominator to account for leap years over long datasets.
    df['seasonal_phase'] = np.cos(2 * np.pi * (day_of_year - solstice_day) / 365.25)
    
    return df
