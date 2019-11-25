
library(shiny)
library(plotly)
library(dplyr)
library(shinydashboard)
source("page_1.R")
source("viz_1.R")
source("viz_2.R")
source("page_2.R")
source("page_3.R")
source("page_4.R")
source("page_5.R")
source("page_6.R")
source("group_members.R")
source("appendix_1.R")
source("appendix_2.R")
suicide_rate <- read.csv("master.csv")
ages <- unique(suicide_rate$age)
# Use a fluid Bootstrap layout
ui_page <- dashboardPage(
  dashboardHeader(title = "Menu"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Cover Page", tabName = "author"),
      menuItem("1.0 Introduction  ", tabName = "page_1"),
      menuItem("2.0 Research Questions", tabName = "page_2"),
      menuItem("3.0 Possible Data Sets ", tabName = "page_3"),
      menuItem("Visualization_1", tabName = "Visualization_1"),
      menuItem("Visualization_2", tabName = "Visualization_2"),
      menuItem("4.0 Information Visualizations  ", tabName = "page_4"),
      menuItem("5.0 Technical description", tabName = "page_5"),
      menuItem("6.0 Conclusion", tabName = "page_6"),
      menuItem("Appendix 1", tabName = "dictionary"),
      menuItem("Reflection of members", tabName = "reflection")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "author",
              authors
      ),
      tabItem(tabName = "page_1",
                report_page
      ),
      tabItem(tabName = "page_2",
              report_2
      ),
      tabItem(tabName = "page_3",
              report_3
      ),
      tabItem(tabName = "page_4",
              report_4
      ),
      tabItem(tabName = "page_5",
              report_5
      ),
      tabItem(tabName = "page_6",
              report_6
      ),
      tabItem(tabName = "Visualization_1",
        visual_1 
        ),
      tabItem(tabName = "Visualization_2",
        visual_2
      ),
      tabItem(tabName = "dictionary",
        appendix_1        
      ),
      tabItem(tabName = "reflection",
        appendix_2      
              )
    )
  ) #dashbody end
)
shinyUI(ui_page)


