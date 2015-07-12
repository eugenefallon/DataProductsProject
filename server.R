library(shiny)
## Some setup for our web app to load libraries and data
library(ISLR)
library(caret)
data(Wage)
inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7,
                               list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain]

shinyServer(
  function(input, output) {
    output$summary <- renderTable(summary(training))
    output$nsv <- renderTable(nearZeroVar(training,saveMetrics=TRUE))
    output$theplot <- renderPlot(plot(training$age, training$wage))
  }
)
