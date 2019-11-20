library(shiny)
library(plotly)
library(dplyr)

suicide_rate <- read.csv("master.csv")
ages <- unique(suicide_rate$age)
# Use a fluid Bootstrap layout
visual_2 <- fluidPage(    
  
  # Give the page a title
  titlePanel("Suicide Rate"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("sex", "Gender:", 
                  choices=c("male", "female")),
      radioButtons("age","Age:",
                   choices = ages),
      hr(),
      helpText("Data from Kaggle.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)
