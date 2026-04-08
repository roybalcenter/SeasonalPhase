# Sample SAS program for transforming a date into an astronomical seasonal phase variable
# - code produced by Gemini on April 7, 2026 
# - oriented around northern hemisphere
# - for single year date ranges that are not in a leap year, change the number of days to 365
# - the constant('PI') function is used because it is more precise than typing 3.14159 and is the standard way to handle geometric calculations in SAS.
# - data from a database might be a Datetime (seconds) rather than a Date (days). If you see very large numbers, use the datepart() function as shown in the comments to convert it to a standard SAS date before calculating the day_of_year.

/* DATA step to create the seasonal phase variable */
data seasonal_transformed;
    set original_data;

    /* 1. Extract day_of_year (1-366) */
    /* If your input is a DATETIME, wrap date_var in the datepart() function first */
    day_of_year = datepart(date_var) - intnx('year', datepart(date_var), 0) + 1;
    
    /* 2. Set constants */
    /* pi_val provides high precision; solstice_day is June 21 anchor */
    pi_val = constant('PI');
    solstice_day = 172;

    /* 3. Calculate the seasonal_phase (+1 to -1) */
    /* Dividing by 365.25 handles the average tropical year length */
    seasonal_phase = cos(2 * pi_val * (day_of_year - solstice_day) / 365.25);

    /* 4. Housekeeping: Remove intermediate calculation variables */
    drop pi_val solstice_day day_of_year;
    format seasonal_phase 8.4;
run;
