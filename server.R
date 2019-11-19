library(shiny)
library(plotly)
library(dplyr)
library(rsconnect)
library(ggplot2)


# Define a server for the Shiny app
suicide_rate <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a plot
    suicide_rate <- read.csv("suicide_rate.csv")
    df <-suicide_rate[suicide_rate$sex==input$sex & suicide_rate$age==input$age,]
    ggplot(data=df, aes(x=population)) + geom_histogram()
  })
}

