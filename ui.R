library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Developing Data Products Project"),
  sidebarPanel(
      p('This is a simple application to assist in analyzing a dataset to determine the best features to use for prediction.'),
      p('I am basing this on the content from the Practical Machine Learning course, specifically the lecture on Covariate Creation'),
      p('This project will use the wage data contained in the ISLR package, a future enhancement might be to allow input of the dataset to analyze.'),
      p('On startup, the app displays information for the entire dataset.'),
      p('Users should use the dropdown below to select a region for subsetting and analyzing the data ')
  ),
  mainPanel(
      tabsetPanel(
          tabPanel('Summary of the dataset', tableOutput("summary")),
          tabPanel('Output from the nearZeroVar function for this dataset', tableOutput("nsv")),
          tabPanel('Simple plot of age and wage', plotOutput("theplot"))
      )
  )
))
