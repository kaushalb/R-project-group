library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)
library(rsconnect)
library(R.utils)
dictionary <- read.csv("dict.csv")
present <- kable(dictionary)
suicide_rate <- read.csv("master.csv")
server_func <- function(input, output) {
  
  # Fill in the spot we created for a plot
      output$plot <- renderPlot({
        df <- suicide_rate %>% 
          filter(sex == input$gender) %>%
          filter(country == input$country) 
          
        
        ggplot(data = df) +  
          geom_point(mapping = aes(x = gdp_per_capita, y = suicides_per_100k_pop, color = sex))
      })
  
}
shinyServer(server_func)