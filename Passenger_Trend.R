#R_Package
#Team Members:23PT18,23PT19
#Time_series

#Importing Libraries

library(timeSeries)       
library(astsa)
library(forecast)

#1)AirPassengers data set

data("AirPassengers")     #Importing Dataset

class(AirPassengers)      #This tells you that the data series is in time series format


#Basic Functions on data sets
start(AirPassengers)

end(AirPassengers)

frequency(AirPassengers)

cycle(AirPassengers)

#Plotting the data set

par(mfrow=c(1,2))
plot(AirPassengers)

#boxplot(AirPassengers~cycle(AirPassengers))



plot(log(AirPassengers))  #Make variance constant


plot(diff(log(AirPassengers)))

abline(reg=lm(diff(log(AirPassengers))~time(diff(log(AirPassengers)))))


#AR I MA -Auto Regressive Integration Moving Average
# p d q
#p- We use p past observations from the time series as predictors
#d- No of times differentiated
#q- Uses q past forecast errors as predictors

#acf-auto correlation function

acf(diff(log(AirPassengers)))   #Determines the value of q  here it's 1(line before getting inverted)

#partial auto corelation function
pacf(diff(log(AirPassengers)))  #Determines the value of p

#d - number of differentiation here 1

fit<-arima(log(AirPassengers),c(0,1,1),list(order=c(0,1,1),period=12))

pred<-predict(fit,n.ahead = 10*12)

pred1<-2.718^pred$pred

ts.plot(AirPassengers,2.718^pred$pred,log="y",lty=c(1,3))

#Checking for the correctness of our prediction

datawide<-ts(AirPassengers,frequency=12,start = c(1949,1),end=c(1959,12))

fit<-arima(log(datawide),c(0,1,1),list(order=c(0,1,1),period=12))

pred<-predict(fit,n.ahead = 10*12)
pred1<-2.718^pred$pred
data1<-head(pred1,12)

predicted_1960<-round(data1,digits  =0) 

original_1960<-tail(AirPassengers,12)




#One_step_ahead_sarima

set<-window(AirPassengers,start=c(1949,1),end=c(1955,12))
validation<-window(AirPassengers,start=c(1956,1))
one_step_ahead_sarima<-matrix(ncol=2,nrow=60)
arima_optional<-auto.arima(set)

#P,D,Q- Seasonal Model
for(i in 1:60){
  
  observed_set<-window(AirPassengers,start=c(1949,1),end=c(1955,12+i),frequency=12)
  forecasted_sarima<-sarima.for(observed_set,n.ahead=1,p=0,d=1,q=1,P=1,D=1,Q=0,S=12)
  demandforecast=forecasted_sarima$pred
  observed=validation[[i]]
  one_step_ahead_sarima[i,1]=observed
  one_step_ahead_sarima[i,2]=demandforecast    
}

plot(AirPassengers,col='blue',xlab='Year')
lines(ts(one_step_ahead_sarima[,2],start=c(1956,1),frequency=12),col='red',lwd=3)
