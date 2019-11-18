
library(shiny)
library(plotly)
library(dplyr)

library(rsconnect)
suicide_rate <- read.csv("./data/suicide_rate.csv")
# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("David Hendry you bitch"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("population", "population:", 
                  choices=colnames(suicide_rate)),
      hr(),
      helpText("Data from AT&T (1961) The World's Telephones.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)


