
library(shiny)
library(knitr)

 #ui
source("AF7_ui.R")
source("AF7_server.R")
shinyApp(ui = ui_page, server = server_func)

