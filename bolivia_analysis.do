*******************************************************
* BOLIVIA - ENVIRONMENTAL KUZNETS CURVE ANALYSIS
* Period: 1970-2024
* Source: World Bank - World Development Indicators
* Software: Stata 15
*******************************************************

clear all
set more off

* Set working directory
cd "C:\Users\borac\OneDrive\Desktop\Bolivya_Midterm"

*******************************************************
* 1. IMPORT CO2 DATA
*******************************************************

import excel "API_BOL_EN.GHG.CO2.PC.CE.AR5_EN_excel_v2_184034.xls", sheet("Data") cellrange(O4:BQ5) clear

destring O-BQ, replace
xpose, clear

rename v1 year
rename v2 co2

save "bolivia_co2.dta", replace

*******************************************************
* 2. IMPORT GDP PER CAPITA DATA
*******************************************************

import excel "API_BOL_NY.GDP.PCAP.KD_EN_excel_v2_184035.xls", sheet("Data") cellrange(O4:BQ5) clear

destring O-BQ, replace
xpose, clear

rename v1 year
rename v2 gdp

save "bolivia_gdp.dta", replace

*******************************************************
* 3. MERGE DATASETS
*******************************************************

merge 1:1 year using "bolivia_co2.dta"

assert _merge == 3
drop _merge

sort year

*******************************************************
* 4. DATA VALIDATION
*******************************************************

assert !missing(year, co2, gdp)
assert co2 > 0 & gdp > 0
assert _N == 55
assert year[1] == 1970
assert year[_N] == 2024

summarize year co2 gdp

*******************************************************
* 5. LOGARITHMIC TRANSFORMATION
*******************************************************

generate ln_co2 = ln(co2)
generate ln_gdp = ln(gdp)
generate ln_gdp_sq = ln_gdp^2

summarize ln_co2 ln_gdp ln_gdp_sq

save "bolivia_final.dta", replace

*******************************************************
* 6. ENVIRONMENTAL KUZNETS CURVE GRAPH
*******************************************************

twoway (scatter ln_co2 ln_gdp) (qfit ln_co2 ln_gdp), title("Environmental Kuznets Curve - Bolivia") xtitle("Log GDP per capita") ytitle("Log CO2 emissions per capita") legend(order(1 "Observations" 2 "Quadratic fit"))

graph export "bolivia_ekc_graph.png", width(1600) replace
graph save "bolivia_ekc_graph.gph", replace

*******************************************************
* 7. OLS REGRESSION
*******************************************************

log using "bolivia_regression.log", text replace

regress ln_co2 ln_gdp ln_gdp_sq

log close

*******************************************************
* END OF ANALYSIS
*******************************************************
