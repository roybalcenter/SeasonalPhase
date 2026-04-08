# Sample SPSS syntax for transforming a date into an astronomical seasonal phase variable
# - code produced by Gemini on April 7, 2026 
# - oriented around northern hemisphere. To flip the seasons for the Southern Hemisphere, change the formula to:
#     COMPUTE seasonal_phase = -1 * COS(2 * $PI * (day_of_year - 172) / 365.25).
# - for single year date ranges that are not in a leap year, change the number of days to 365
# - replace date_var with the actual name of your date column
# - ensure your date column is actually defined as a "Date" format in the Variable View. If it is currently a String, you must convert it using NUMBER(date_string, ADATE10) or a similar function first .


* 1. Extract the Day of the Year (1 to 366).
* IMPORTANT: 'date_var' must be defined as a DATE format in the Variable View.
COMPUTE day_of_year = XDATE.JDAY(date_var).

* 2. Define the Phase Transformation using a Cosine wave.
* $PI is the SPSS system constant for 3.14159...
* 172 is the June 21 anchor. Use 355 for Southern Hemisphere datasets.
COMPUTE seasonal_phase = COS(2 * $PI * (day_of_year - 172) / 365.25).

* 3. Apply changes to the active dataset.
EXECUTE.

* Optional: Format output for 4 decimal places for better precision.
FORMATS seasonal_phase (F8.4).
