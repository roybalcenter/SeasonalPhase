# Sample Python code for transforming a date into an astronomical seasonal phase variable
# - code produced by Gemini on April 8, 2026 
# - oriented around the summer solstice in the northern hemisphere; multiply seasonal_phase by -1 for values in the southern hemisphere (or change reference day in line 29)
# - ensure the input column is a true datetime object using pd.to_datetime() before running the function, otherwise .dt.dayofyear will throw an error.

# Import necessary libraries
import pandas as pd
import numpy as np

# Load the dataset from 'dates.csv' into a pandas DataFrame (replace filename to correspond to target dataset).
df = pd.read_csv('dates.csv')

# Display the first few rows of the DataFrame to inspect the initial data.
print("Original DataFrame head:")
display(df.head())

# Define a function to calculate the astronomical seasonal phase.
# This function transforms a date into a continuous seasonal variable (+1 to -1).
def calculate_seasonal_phase(df, date_var):
    # 1. Extract the 'Day of the Year' (Julian Day)
    # This results in an integer from 1 to 366.
    # We use this to strip away the 'Year' so that June 21st is
    # treated the same regardless of whether it's 2020 or 2024.
    day_of_year = df[date_var].dt.dayofyear

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

# Convert the 'date_var' column to datetime objects.
# This is crucial for the .dt accessor to work correctly in the calculate_seasonal_phase function.
df['date_var'] = pd.to_datetime(df['date_var'])

# Call the pre-defined calculate_seasonal_phase function to add the 'seasonal_phase' column.
df = calculate_seasonal_phase(df, 'date_var')

# Display the first few rows of the DataFrame with the newly added 'seasonal_phase' column.
print("\nDataFrame head after calculating seasonal phase:")
display(df.head())
