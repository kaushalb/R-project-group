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
      country_var <- input$country
      if(country_var!="All"){
        df <- df %>% filter(country==country_var)
      }
      ggplot(data=df, aes(y=suicides_per_100k_pop,x=gdp_per_capita, color = generation)) + geom_point() + 
        geom_smooth() + 
        labs(x="GDP Per Capita", y="Suicides Per 100K Population")
      
  })
  
  output$plot2 <- renderPlot({
    sex_var <- input$sex2
    country_var <- input$country2
    df <- suicide_rate
    if(sex_var!="All"){
      df <- df %>% filter(sex==sex_var)
    }
    if(country_var != "All"){
    df <- df %>% filter(country==input$country2)
    }
    df %>% group_by(generation) %>% summarise(avg_suicide_gdp=mean(suicides_per_100k_pop, na.rm=T) * mean(gdp_per_capita)) %>% 
      ggplot(aes(x=generation, y= avg_suicide_gdp)) + geom_bar(stat="identity", fill="steelblue") + 
      labs(x = "Generations", y = "Hypothesis Value (gdp per capita x suicide rates)")
    
  })
  
  output$plot3 <- renderPlot({
    sex_var <- input$sex2
    country_var <- input$country2
    df <- suicide_rate
    if(sex_var!="All"){
      df <- df %>% filter(sex==sex_var)
    }
    if(country_var!= "All"){
    df <- df %>% filter(country==input$country2)
    }
    ggplot(data=df, aes(x=year, y=suicides_per_100k_pop)) + geom_point() + geom_smooth()+ 
      labs(x = "Year", y = "Suicides per 100k People")
    
  })
  
  output$table <- renderTable({
    dictionary
  })
  
  
}
shinyServer(server_func)