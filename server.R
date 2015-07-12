library(shiny)
x <<- x + 1
y <<- 0

shinyServer(
  function(input, output) {
    y <<- y + 1
    output$text4 <- renderText(y)
    output$text5 <- renderText(x)
  }
)
