## Dynamic Regression Models
## Essentially using other features to predict forecast

example

> fit <- auto.arima(uschange[, "Consumption"],
                    xreg = uschange[, "Income"])

> # rep(x, times)
> fcast <- forecast(fit, xreg = rep(0.8, 8))




## ----------------------------------------------------------------------------

# Time plot of both variables
autoplot(advert, facets = TRUE)

# Fit ARIMA model
fit <- auto.arima(advert[, "sales"], xreg = advert[, "advert"], stationary = TRUE)

# Check model. Increase in sales for each unit increase in advertising
salesincrease <- coefficients(fit)[3]

# Forecast fit as fc
fc <- forecast(fit, xreg = rep(10, 6))

# Plot fc with x and y labels
autoplot(fc) + xlab("Month") + ylab("Sales")


Series: advert[, "sales"] 
Regression with ARIMA(1,0,0) errors 

Coefficients:
         ar1  intercept   xreg
      0.7247    79.2725  0.508
s.e.  0.1339     0.7349  0.022

sigma^2 estimated as 1.116:  log likelihood=-34.15
AIC=76.29   AICc=78.4   BIC=81

Training set error measures:
                      ME     RMSE       MAE         MPE      MAPE      MASE
Training set -0.03570439 0.988353 0.7612276 -0.06588987 0.8951198 0.1650164
                   ACF1
Training set 0.02381244


## ----------------------------------------------------------------------------

# Time plots of demand and temperatures
autoplot(elec[, c(1, 2)], facets = TRUE)

# Matrix of regressors
xreg <- cbind(MaxTemp = elec[, "Temperature"], 
              MaxTempSq = elec[, "Temperature"]^2, 
              Workday = elec[, "Workday"])

# Fit model
fit <- auto.arima(elec[,"Demand"], xreg = xreg)

# Forecast fit one day ahead
forecast(fit, xreg = cbind(20, 20^2, 1))



## ----------------------------------------------------------------------------

example:

# fourier(x, K, h = NULL)

> fit <- auto.arima(cafe, xreg = fourier(cafe, K = 6),
                    seasonal = FALSE, lambda = 0)
> fit %>%
    forecast(xreg = fourier(cafe, K = 6, h = 24)) %>%
    autoplot() + ylim(1.6, 5.1)


# Set up harmonic regressors of order 13
harmonics <- fourier(gasoline, K = 13)

# Fit regression model with ARIMA errors
fit <- auto.arima(gasoline, xreg = harmonics, seasonal = FALSE)

# Forecasts next 3 years
newharmonics <- fourier(gasoline, K = 13, h = 3*52)
fc <- forecast(fit, xreg = newharmonics)

# Plot forecasts fc
autoplot(fc)



## ----------------------------------------------------------------------------

Fit a harmonic regression called fit to taylor using order 10 for each 
type of seasonality.

Forecast 20 working days ahead as fc. Remember that the data are 
half-hourly in order to set the correct value for h.

Create a time plot of the forecasts.

Check the residuals of your fitted model. As you can see, 
auto.arima() would have done a better job.

# Fit a harmonic regression using order 10 for each type of seasonality
fit <- tslm(taylor ~ fourier(taylor, K = c(10, 10)))

# Forecast 20 working days ahead
fc <- forecast(fit, newdata = data.frame(fourier(taylor, K = c(10,10), h = 20*48)))

# Plot the forecasts
autoplot(fc)

# Check the residuals of fit
checkresiduals(fit)



## ----------------------------------------------------------------------------

# Plot the calls data
autoplot(calls)

# Set up the xreg matrix
xreg <- fourier(calls, K = c(10, 0))

# Fit a dynamic regression model
fit <- auto.arima(calls, xreg = xreg, seasonal = FALSE, stationary = TRUE)

# Check the residuals
checkresiduals(fit)

# Plot forecasts for 10 working days ahead
fc <- forecast(fit, xreg =  fourier(calls, c(10, 0), h = 10*169))
autoplot(fc)


## ----------------------------------------------------------------------------

# Plot the gas data
autoplot(gas)

# Fit a TBATS model to the gas data
fit <- tbats(gas)

# Forecast the series for the next 5 years
fc <- forecast(fit, h = 5*12)

# Plot the forecasts
autoplot(fc)

# Record the Box-Cox parameter and the order of the Fourier terms
lambda <- 0.082
K <- 5


## ----------------------------------------------------------------------------

