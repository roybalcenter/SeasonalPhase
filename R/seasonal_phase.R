# Sample R script for transforming a date into an astronomical seasonal phase variable
# - Code produced by Gemini on April 7, 2026 
# - Oriented around northern hemisphere
# - For single year date ranges that are not in a leap year, change the number of days to 365
# - Ensure your column is of class Date or POSIXct. If you import from a CSV, you may need to wrap your column in as.Date(df$date) before passing it to the function.
#    ensure the input column is a true datetime object using pd.to_datetime() before running the function, otherwise .dt.dayofyear will throw an error.
# - Check your wave by running plot(df$date, df$seasonal_phase, type="l") to ensure the peaks and valleys land exactly where you expect them.



# Load lubridate for easier date handling
# install.packages("lubridate")
library(lubridate)

calculate_seasonal_phase <- function(dates) {
  # day_of_year extracted via yday
  day_of_year <- yday(dates)
  
  # solstice_day anchor
  solstice_day <- 172
  
  # seasonal_phase calculation
  seasonal_phase <- cos(2 * pi * (day_of_year - solstice_day) / 365.25)
  
  return(seasonal_phase)
}
