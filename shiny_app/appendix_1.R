library(knitr)
library(shiny)
dictionary <- read.csv("dict.csv")
present <- kable(dictionary)
appendix_1 <- fluidPage(
  tableOutput(present)
)