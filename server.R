library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)
library(rsconnect)
library(kableExtra)


dictionary <- read.csv("dict.csv", fileEncoding="UTF-8-BOM", stringsAsFactors = F)
present <- kable(dictionary)
suicide_rate <- read.csv("master.csv",fileEncoding="UTF-8-BOM", stringsAsFactors = F)


server_func <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$plot1 <- renderPlot({
      sex_var <- input$sex
      df <- suicide_rate
      if(sex_var!="All"){
        df <- df %>% filter(sex==sex_var)
      }
      df <- df %>% filter(country==input$country)
      ggplot(data=df, aes(y=suicides_per_100k_pop,x=gdp_per_capita, color = generation)) + geom_point() + 
        labs(x="GDP Per Capita", y="Suicides Per 100K Population")
      
  })
  
  output$plot2 <- renderPlot({
    sex_var <- input$sex2
    df <- suicide_rate
    if(sex_var!="All"){
      df <- df %>% filter(sex==sex_var)
    }
    df <- df %>% filter(country==input$country2)
    df %>% group_by(generation) %>% summarise(avg=mean(suicides_per_100k_pop, na.rm=T)) %>% 
      ggplot(aes(x=generation, y=avg)) + geom_bar(stat="identity", fill="steelblue") 
    
  })
  
  output$plot3 <- renderPlot({
    sex_var <- input$sex2
    df <- suicide_rate
    if(sex_var!="All"){
      df <- df %>% filter(sex==sex_var)
    }
    df <- df %>% filter(country==input$country2)
    ggplot(data=df, aes(x=year, y=suicides_per_100k_pop)) + geom_point() + geom_smooth()
    
  })
  
  output$table <- renderTable({
    dictionary
  })
  
  
}
shinyServer(server_func)