# Bolivia-EKC-Analysis
Environmental Kuznets Curve Analysis for Bolivia (1970-2024) using Stata 15

# Environmental Kuznets Curve Analysis for Bolivia

**Student:** İlayda Azra Ünal  
**Country:** Bolivia  
**Period:** 1970–2024  
**Software:** Stata 15

## 1. Purpose

This homework examines whether the Environmental Kuznets Curve (EKC) hypothesis holds for Bolivia. The EKC suggests that pollution may first increase with income and then decrease at higher income levels.

## 2. Data

I used annual data from the World Bank's World Development Indicators database for 1970–2024.

- CO2 emissions excluding LULUCF per capita: `EN.GHG.CO2.PC.CE.AR5`
- GDP per capita, constant 2015 US$: `NY.GDP.PCAP.KD`

The final dataset contains 55 annual observations.

## 3. Analysis steps

1. Import the CO2 and GDP per capita Excel files into Stata.
2. Merge the two datasets by year.
3. Check for missing values and confirm the period 1970–2024.
4. Calculate the natural logarithms of CO2 emissions and GDP per capita.
5. Create the squared term of log GDP per capita.
6. Make a scatter plot and add a quadratic fitted regression line.
7. Estimate the nonlinear model using ordinary least squares (OLS).
8. Interpret the coefficient signs and the EKC hypothesis.

The estimated model is:

`ln(CO2) = beta0 + beta1*ln(GDP) + beta2*[ln(GDP)]^2 + error`

## 4. Regression results

| Variable | Coefficient | p-value |
|---|---:|---:|
| ln(GDP) | -15.43895 | 0.023 |
| [ln(GDP)]^2 | 1.08699 | 0.014 |
| Constant | 54.53990 | 0.038 |

Number of observations: 55. R-squared: 0.8505.

## 5. Conclusion

The results do not support the usual inverted-U EKC hypothesis for Bolivia in 1970–2024. The coefficient of log GDP is negative, while the coefficient of squared log GDP is positive. This indicates a U-shaped relationship instead of an inverted-U relationship. The results show an association, not necessarily a causal effect.

## 6. Repository files

- `bolivia_analysis.do` — Stata commands for the analysis.
- `bolivia_final.dta` — Final Stata dataset.
- `API_BOL_EN.GHG.CO2.PC.CE.AR5_EN_excel_v2_184034.xls` — World Bank CO2 data.
- `API_BOL_NY.GDP.PCAP.KD_EN_excel_v2_184035.xls` — World Bank GDP data.
- `bolivia_ekc_graph.png` — Scatter plot with quadratic fitted line.
- `bolivia_regression.png.png` — Screenshot of the Stata regression result.

## 7. How to reproduce the analysis

1. Download all repository files into one folder.
2. Open `bolivia_analysis.do` in Stata 15.
3. In Stata, set the working directory to the folder containing the downloaded project files before running the do-file.
4. Run the complete do-file.

The do-file imports the source data, creates the final dataset, produces the EKC graph, and runs the OLS regression.

## Data source

World Bank, World Development Indicators: https://databank.worldbank.org/reports.aspx?source=world-development-indicators
