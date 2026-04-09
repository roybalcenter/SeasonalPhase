# Seasonal Phase Transformation

This repository provides standardized code to transform calendar dates into a continuous seasonal variable using a cosine wave. This method anchors the astronomical solstices and equinoxes to a scale of +1 to -1, allowing researchers to incorporate periodic seasonal effects into statistical and machine learning models.

[![DOI](https://img.shields.io/badge/DOI-10.XXXX/OSF.XXXX-blue.svg)](https://doi.org/10.XXXX/OSF.XXXX)

## The Mathematical Model

The seasonal phase ($S$) for a given day ($d$) is defined by the angular distance from the summer solstice:

$$S = \cos\left( \frac{2\pi(d - d_s)}{L} \right)$$

Where:
- **$d$**: The day of the year (1–366).
- **$d_s$**: The summer solstice anchor (Day 172).
- **$L$**: The average tropical year length (365.25 days).

This maps the year onto a continuous wave:
- **+1.0**: Summer Solstice (Maximum solar energy/day length).
- **-1.0**: Winter Solstice (Minimum solar energy/day length).
- ** 0.0**: Vernal and Autumnal Equinoxes.

## Repository Structure

The repository is organized by programming environment to assist researchers using different statistical software:

- `/python`: Implementation using `pandas` and `numpy`.
- `/r`: Function utilizing `lubridate` and base R vectorization.
- `/spss`: SPSS "Syntax" utilizing `COMPUTE` and `XDATE.JDAY`.

## Testing the Code

Before applying these scripts to your own data, you can use the provided **`dates.csv`** file to verify the accuracy of the transformation in your environment. 

The test file includes:
1. **Solstices (2023-2026):** Note that while the calendar date shifts (June 20 vs. June 21), the Julian day (172) remains the consistent astronomical anchor.
2. **Equinoxes:** Dates where the output should approach zero.

## Adjusting for Hemisphere

The default scripts are set for the **Northern Hemisphere** (Summer Solstice = Day 172). 
- **Southern Hemisphere:** To use this code for Southern Hemisphere data, adjust the `solstice_day` variable in the scripts to **355** (December 21) or multiply the final `seasonal_phase` result by -1.

## Permanent Archive
A persistent version of this repository and associated datasets can be found on the Open Science Framework (OSF) at: [INSERT OSF LINK HERE]

## License

This project is licensed under the [MIT License](LICENSE).

## Citation

If you use this method in your publication, please cite:
*Insert your paper citation here.*
