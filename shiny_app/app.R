
library(shiny)
library(knitr)

 #ui
source("ui.R")
source("server.R")
shinyApp(ui = ui_page, server = server_func)

