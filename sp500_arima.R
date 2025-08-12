# Load Necessary Libraries
library(quantmod)
library(forecast)
library(tseries)
# Step 1: Data Retrieval and Preprocessing
# Retrieve S&P 500 Adjusted Closing Prices
getSymbols("^GSPC", from = "2000-01-03", to = "2023-12-29")
sp500_prices <- Ad(GSPC)  # Use adjusted closing prices

# Calculate log returns
log_returns <- diff(log(coredata(sp500_prices)))

# Remove NA values
log_returns <- na.omit(log_returns)

# Plot Log Returns
plot(log_returns, main = "Log Returns of S&P 500(2000–2023)", ylab = "Log Returns", col = "red", type = "p")
grid()
legend("topleft", "Log Returns", col = "red", lty = 1, lwd = 2)

# Step 2: Stationarity Check
# Perform Augmented Dickey-Fuller Test
adf_test <- adf.test(log_returns, alternative = "stationary")
cat("ADF Test Results:\n")
print(adf_test)

if (adf_test$p.value > 0.05) {
  cat("Result: Non-stationary series. Consider differencing.\n")
} else {
  cat("Result: Stationary series.\n")
}

# Step 3: Empirical vs Normal Distribution of Log Returns
hist(log_returns, breaks = 50, probability = TRUE, main = "Empirical vs. Normal Distribution of Log Returns",
     xlab = "Log Returns", col = "lightblue", border = "white")
lines(density(log_returns), col = "blue", lwd = 2)  # Empirical density
curve(dnorm(x, mean = mean(log_returns), sd = sd(log_returns)), add = TRUE, col = "red", lwd = 2)  # Normal density
legend("topright", legend = c("Empirical", "Normal"), col = c("blue", "red"), lty = 1, lwd = 2)

# Step 4: Model Identification
# ACF and PACF for Log Returns
par(mfrow = c(1, 2))
acf(log_returns, main = "ACF of S&P 500 Log Returns")
pacf(log_returns, main = "PACF of S&P 500 Log Returns")
par(mfrow = c(1, 1))
# d = 0, means that model fit model fit actual value of the data but not the differences of 2 consecutive values.

# Step 5: ARIMA Model Fitting
# Automatic ARIMA Model Selection
fit_auto <- auto.arima(log_returns, d = 0)  # Force d = 0 for stationary log returns
cat("Auto ARIMA Model Summary:\n")
print(summary(fit_auto))

# Manual ARIMA Model Selection (Example: ARIMA(1,0,1))
fit_manual <- Arima(log_returns, order = c(1, 0, 1))
cat("Manual ARIMA Model Summary:\n")
print(summary(fit_manual))

# Step 6: Residual Diagnostics
# Residual Diagnostics for Manual ARIMA Model
cat("Residual Diagnostics for Manual ARIMA Model:\n")
checkresiduals(fit_manual)

# Residual Diagnostics for Auto ARIMA Model
cat("Residual Diagnostics for Auto ARIMA Model:\n")
checkresiduals(fit_auto)

# Step 7: Model Performance Comparison

# Calculate Model Performance Metrics
mse_manual <- mean(residuals(fit_manual)^2)
mse_auto <- mean(residuals(fit_auto)^2)
aic_manual <- AIC(fit_manual)
aic_auto <- AIC(fit_auto)
bic_manual <- BIC(fit_manual)
bic_auto <- BIC(fit_auto)
rmse_manual <- sqrt(mse_manual)
rmse_auto <- sqrt(mse_auto)
mae_manual <- mean(abs(residuals(fit_manual)))
mae_auto <- mean(abs(residuals(fit_auto)))

# Create a DataFrame for Metrics
model_performance <- data.frame(
  Metric = c("MSE", "AIC", "BIC", "RMSE", "MAE"),
  Manual_ARIMA = c(mse_manual, aic_manual, bic_manual, rmse_manual, mae_manual),
  Auto_ARIMA = c(mse_auto, aic_auto, bic_auto, rmse_auto, mae_auto)
)

# Display the DataFrame
print(model_performance)