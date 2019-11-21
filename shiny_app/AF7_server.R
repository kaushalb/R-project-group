library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)
library(rsconnect)
suicide_rate <- read.csv("master.csv")
server_func <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a plot
    suicide_rate <- read.csv("master.csv", fileEncoding = "UTF-8-BOM")
    df <-suicide_rate %>%
      select(country, year, gdp_per_capita, suicides_per_100k_pop, sex, generation
             )
    plot_1 <-  ggplot(data = df, aes(x = df$gdp_per_capita, y = df$suicides_per_100k_pop, color = df$sex)) + 
      geom_point()
  })
}
shinyServer(server_func)