library(knitr)
dictionary <- read.csv("dict.csv")
present <- kable(dictionary)
appendix_1 <- fluidPage(
  present
)