# Sample SPSS syntax for transforming a date into an astronomical seasonal phase variable
# - code produced by Gemini on April 7, 2026 
# - oriented around northern hemisphere. To flip the seasons for the Southern Hemisphere, multiply seasonal_phase by -1
# - for single year date ranges that are not in a leap year, change the number of days in line 18 from 365.25 to 365
# - replace date_var with the actual name of your date column
# - ensure your date column is actually defined as a "Date" format in the Variable View. If it is currently a String, you must convert it using NUMBER(date_string, ADATE10) or a similar function first .

* 1. Calculate Pi and store it in a variable.
* We use 4 * ARTAN(1) to get the most precise value of Pi possible in SPSS.
COMPUTE pi_val = 4 * ARTAN(1).

* 2. Extract the Day of the Year (1 to 366).
* Ensure 'date_var' is formatted as a DATE in your dataset.
COMPUTE day_of_year = XDATE.JDAY(date_var).

* 3. Calculate the seasonal phase.
* 172 is the June 21 anchor (Summer).
COMPUTE seasonal_phase = COS(2 * pi_val * (day_of_year - 172) / 365.25).

* 4. Apply the changes and clean up.
EXECUTE.

* Optional: Delete the pi_val and day_of_year columns to keep your data clean.
DELETE VARIABLES pi_val day_of_year.
