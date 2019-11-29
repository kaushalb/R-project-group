library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)

suicide_rate <- read.csv("master.csv", fileEncoding="UTF-8-BOM")
# Use a fluid Bootstrap layout
visual_1 <- fluidPage(    
  titlePanel("Suicide Rate vs GDP per Capita"),
  fluidRow(
    column(3,
           wellPanel(
             h4("Filter"),
             selectInput("sex", "display sex of the groups",
                         c("All", "Male", "Female")
             ),
             selectInput("country", "Country: ", suicide_rate$country)
           )
           
    ),
    column(9
           #ggvisOutput("plot_1")
            )
    )
)

