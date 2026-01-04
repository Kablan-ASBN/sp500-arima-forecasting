# S&P 500 Time-Series Forecasting (ARIMA, R)

## Overview
This project demonstrates **disciplined time-series modeling and statistical validation** on real financial data using classical ARIMA methods. The goal is not to predict markets or optimize returns, but to show how forecasting models are **properly specified, tested, compared, and interpreted** in finance, risk, and analytics contexts.

The emphasis is on **assumptions, diagnostics, and model trade-offs**, which are critical in production analytics and decision-support systems.

## Why This Matters
In many business, finance, and risk environments, the value of a forecasting model comes from:
- correct handling of non-stationary data  
- transparent assumptions and diagnostic checks  
- explainable model selection decisions  

This project prioritizes methodological rigor and interpretability over black-box performance.

## What Was Done
- Pulled **S&P 500 adjusted prices (2000–2023)** and computed log returns  
- Tested stationarity using **ADF** and inspected **ACF/PACF**  
- Built and compared:
  - a manually specified **ARIMA(1,0,1)**
  - an automatically selected **auto.arima** model  
- Evaluated models using **MSE, RMSE, MAE, AIC, and BIC**
- Performed **residual diagnostics** to validate modeling assumptions

## Key Outcome
The manually specified **ARIMA(1,0,1)** offered the best balance of **fit, stability, and interpretability** on returns, with slightly stronger residual behavior than the auto-selected model.

## Tools & Artifacts
**Tools:** R (`quantmod`, `forecast`, `tseries`)  

**Artifacts:**
- Runnable R script: `sp500_arima.R`
- Executed notebook with plots: `SP500_ARIMA_Notebook.pdf`
- Short technical report: `SP500_ARIMA_Report.pdf`

> **Note:** Data is pulled from public sources at runtime; no proprietary data is stored.
