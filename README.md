# sp500-arima-forecasting
Time-series forecasting of S&P 500 (2000–2023) using R & ARIMA. Preprocessing, ADF stationarity testing, residual diagnostics, and model comparison (manual vs. auto). Evaluated with MSE, RMSE, MAE, AIC, BIC. Includes runnable code, notebook (PDF), and a concise report.


# S&P 500 ARIMA Forecasting (R)

**Tools:** R (quantmod, forecast, tseries)  
**Artifacts:** runnable code, executed notebook (PDF), and a short report.

## What this shows
- Pulls S&P 500 adjusted prices (2000–2023) and computes **log returns**  
- Stationarity testing (**ADF**), ACF/PACF inspection  
- **Manual ARIMA(1,0,1)** vs **auto.arima** comparison  
- Residual diagnostics; metrics: **MSE, RMSE, MAE, AIC, BIC**

## Key outcome
Manual **ARIMA(1,0,1)** offered the best balance of fit and simplicity on returns, with slightly better residual performance than the auto model.

## Files
- **Code:** [`code/sp500_arima.R`](code/sp500_arima.R)  
- **Notebook (run output + visuals):** [`notebooks/SP500_ARIMA_Notebook.pdf`](notebooks/SP500_ARIMA_Notebook.pdf)  
- **Report:** [`report/SP500_ARIMA_Report.pdf`](report/SP500_ARIMA_Report.pdf)

> Note: Script pulls public data at run time; no proprietary data stored.
