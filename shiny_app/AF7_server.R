library(shiny)
library(plotly)
library(dplyr)
library(rsconnect)
library(ggplot2)
library(rsconnect)
suicide_rate <- read.csv("master.csv")
server_func <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a plot
    suicide_rate <- read.csv("master.csv")
    df <-suicide_rate
    ggplot(data = df, aes(x = df$gdp_per_capita, y = df$suicides_per_100k_pop)) + 
      geom_point() + 
      ~facet_wrap(df$sex)
  })
}
shinyServer(server_func)