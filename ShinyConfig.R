## Some setup for our web app to load libraries and data
library(ISLR)
library(caret)
data(wage)
inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7,
                               list=FALSE)