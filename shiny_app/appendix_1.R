library(knitr)
library(shiny)

appendix_1 <- fluidPage(
  fluidRow(
    column(12,
      dataTableOutput("table_a1"),
      h4("table not working")
    )
  )
)