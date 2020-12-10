## Benchmark methods and forecast accuracy


# Use naive() to forecast the goog series
fcgoog <- naive(goog, h = 20)

# Plot and summarize the forecasts
autoplot(fcgoog)
summary(fcgoog)

# Use snaive() to forecast the ausbeer series
fcbeer <- snaive(ausbeer, h = 16)

# Plot and summarize the forecasts
autoplot(fcbeer)
summary(fcbeer)


## -------------------------------------------------------------

# Check the residuals from the naive forecasts applied to the goog series
goog %>% naive() %>% checkresiduals()

# Do they look like white noise (TRUE or FALSE)
googwn <- TRUE

# Check the residuals from the seasonal naive forecasts applied to the ausbeer series
ausbeer %>% snaive() %>% checkresiduals()

# Do they look like white noise (TRUE or FALSE)
beerwn <- FALSE


## -------------------------------------------------------------

> # x is a numerical vector or time series
> # To subset observations from 101 to 500
> train <- subset(x, start = 101, end = 500, ...)

> # To subset the first 500 observations
> train <- subset(x, end = 500, ...)

> # f is an object of class "forecast"
> # x is a numerical vector or time series
> accuracy(f, x, ...)

# Create the training data as train
train <- subset(gold, end = 1000)

# h here corresponds to the test set length or the
# number of points you want to forecast

# Compute naive forecasts and save to naive_fc
naive_fc <- naive(train, h = 108)

# Compute mean forecasts and save to mean_fc
mean_fc <- meanf(train, h = 108)

# Use accuracy() to compute RMSE statistics
accuracy(naive_fc, gold)
accuracy(mean_fc, gold)

# Assign one of the two forecasts as bestforecasts
bestforecasts <- naive_fc


## -------------------------------------------------------------

# Create three training series omitting the last 1, 2, and 3 years
train1 <- window(vn[, "Melbourne"], end = c(2014, 4))
train2 <- window(vn[, "Melbourne"], end = c(2013, 4))
train3 <- window(vn[, "Melbourne"], end = c(2012, 4))

# Produce forecasts using snaive()
fc1 <- snaive(train1, h = 4)  
fc2 <- snaive(train2, h = 4)	# Not sure why this is 4 when it should be 8
fc3 <- snaive(train3, h = 4) 

# Use accuracy() to compare the MAPE of each series
accuracy(fc1, vn[, "Melbourne"])["Test set", "MAPE"]
accuracy(fc2, vn[, "Melbourne"])["Test set", "MAPE"]
accuracy(fc3, vn[, "Melbourne"])["Test set", "MAPE"]


## -------------------------------------------------------------
# Compute cross-validated errors for up to 8 steps ahead
e <- tsCV(goog, forecastfunction = naive, h = 8)

# Compute the MSE values and remove missing values
mse <- colMeans(e^2, na.rm = TRUE)

# Plot the MSE values against the forecast horizon
data.frame(h = 1:8, MSE = mse) %>%
  ggplot(aes(x = h, y = MSE)) + geom_point()


## -------------------------------------------------------------
# Create a training set using subset()
num_years <- 20
train <- subset(marathon, end = length(marathon) - num_years)

# Compute SES and naive forecasts, save to fcses and fcnaive
fcses <- ses(train, h = num_years)
fcnaive <- naive(train, h = num_years)

# Calculate forecast accuracy measures
accuracy(fcses, marathon)
accuracy(fcnaive, marathon)

# Save the best forecasts as fcbest
fcbest <- fcnaive


accuracy(fcses, marathon)
                     ME     RMSE      MAE        MPE     MAPE      MASE
Training set -1.0851741 5.863790 4.155948 -0.8603998 2.827993 0.8990906
Test set      0.4574579 2.493971 1.894237  0.3171919 1.463862 0.4097960
                    ACF1 Theil's U
Training set -0.01595953        NA
Test set     -0.12556096 0.6870735


accuracy(fcnaive, marathon)
                     ME     RMSE      MAE        MPE     MAPE      MASE
Training set -0.4638047 6.904742 4.622391 -0.4086317 3.123559 1.0000000
Test set      0.2266667 2.462113 1.846667  0.1388780 1.429608 0.3995047
                   ACF1 Theil's U
Training set -0.3589323        NA
Test set     -0.1255610 0.6799062


## -------------------------------------------------------------


