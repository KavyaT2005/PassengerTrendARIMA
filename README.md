# PassengerTrendARIMA
A data analysis and forecasting project using the AirPassengers dataset to model airline passenger trends from 1949–1960. The project leverages R with libraries such as timeSeries, forecast, and astsa to explore time series characteristics, stabilize variance, and forecast future passenger demand using ARIMA and SARIMA models.

Features
Data Exploration

Visualized seasonal trends, cycles, and variance stabilization (log transformation).

Differenced data to make the series stationary.

Modeling & Forecasting

Applied ARIMA (Auto-Regressive Integrated Moving Average) for trend and seasonality modeling.

Used SARIMA (Seasonal ARIMA) for one-step-ahead forecasting with validation over 1956–1960.

Compared predicted vs. actual 1960 values to validate accuracy.

Visualization

Time series plots of original vs. predicted values.

Highlighted trends and seasonality in historical data.

Tech Stack
Language: R

Libraries: timeSeries, forecast, astsa

Dataset: AirPassengers (monthly airline passengers 1949–1960)
