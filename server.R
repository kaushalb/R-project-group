library(shiny)
library(plotly)
library(dplyr)
library(rsconnect)
library(ggplot2)
# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
 

# Define a server for the Shiny app
suicide_rate <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a barplot
    ggplot(suicide_rate[,input$population],
            main=input$population,
            ylab="Number of Telephones",
            xlab="Year")
  })
}

