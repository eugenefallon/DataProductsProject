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
      datasetInput <- reactive({
          switch(input$whichWage,
                 "all" = Wage,
                 "ind" = subset(Wage, jobclass = "Industrial"),
                 "inf" = subset(Wage, jobclass = "Information"))
          
          })
      
      output$summary <- renderTable({
          inTrain <- createDataPartition(y=datasetInput()$wage,p=0.7,list=FALSE)
          training <- Wage[inTrain,]
          testing <- Wage[-inTrain]          
          summary(training)})
    output$nsv <- renderTable({
        inTrain <- createDataPartition(y=datasetInput()$wage,p=0.7,list=FALSE)
        training <- Wage[inTrain,]
        testing <- Wage[-inTrain] 
        nearZeroVar(training,saveMetrics=TRUE)})
    output$theplot <- renderPlot({
        inTrain <- createDataPartition(y=datasetInput()$wage,p=0.7,list=FALSE)
        training <- Wage[inTrain,]
        testing <- Wage[-inTrain] 
        plot(training$age, training$wage)})
  }
)
