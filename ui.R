
library(shiny)
library(plotly)
library(dplyr)
library(shinydashboard)

suicide_rate <- read.csv("master.csv",fileEncoding="UTF-8-BOM", stringsAsFactors = F)
ages <- unique(suicide_rate$age)
countries <- unique(suicide_rate$country)
# Use a fluid Bootstrap layout
# Introduction
report_page <- fluidPage(
  h2("Introduction"),
  h4("1.1 Problem Situation?"),
  p("Suicide has been an issue for mankind forever, and there has been causes 
     of all sorts.  According to the World Health Organization, every year close 
     to 800,000 people took their lives by their own hands, and many more 
     attempt but failed (Suicide).  What's even more concerning is that it is 
     the third leading cause of teenagers (15-19-year-olds), those that make up 
     the next generation of the society (Suicide).  Another thing the article 
     mentions is that almost 80% of the suicide cases occur in middle and low 
     income countries, which brings the factor of financial situation into the 
     equation.  With almost 800,000 lives lost each year and increasing, we 
     need to understand that this is an issue that affects every single living 
     person may it be themselves or their family and friends that put an end to 
     themselves -- not just those of the specific groups mentioned above, as 
     they are just more discriminated against for this issue.  (Note: the term 
     discrimination here follows the definition in Stanford Encyclopedia of 
     Philosophy (Altman).)  The severity of this issue is something that not 
     only all individuals need to act on for themselves and others, but high up 
     the government needs to resolve as well, considering this is something that 
     is increasingly affecting every member of the society, and institutionalized 
     help would allow those who are isolated or in dire need to get help more 
     easily.  Nowadays most countries have suicide hotlines and other facilities,
     yet they don't necessarily reach to those in need.  In this case we look into
     other factors that might influence suicide in this project, in hope that we 
     can fix other factors to lessen the tension of the issue. "),
  h4("1.2 What is the problem? "),
  p("In simple words, people are dying.  In a more complex matter, people are dying
     because they choose to do so themselves, and they do it because other life 
     matters are so difficult to them that even death seems like the easier option.
     These issues that cause people to choose death may be financial matters, 
     emotional problems, relationship issues, or something else -- this matter will
     be further discussed in the project later on."),
  h4("1.3 Why does it matter? "),
  p("As stated before, this is a growing issue that affects all human beings and 
     must be resolved.  If issues like such that puts matter into life and death 
     can't be resolved, it becomes a major obstacle for humanity to advance any 
     further and such progression would affect the living quality of every single 
     human being that walks the earth.  Even if one does not care about such
     objective, they should still value the lives of their loved ones more or less.
     "),
  h4("1.4 How will it be addressed?"),
  p("The unit of analysis here would be generation groups of either sex of a 
     country of a certain year.  (Note: cases of intersex or more complex matters
     are not included here as they are an extreme minority.  We understand that these
     are extremely vulnerable groups and there are specific LGBTQ+ organizations that
     provides extra support for these individuals.)  For complete list of variables
     of each data entry please refer to Appendix 1: Data Dictionary.  For specific
     variables we're looking at countries, the gdp per capita of the country, the
     generation (age group), the year and sex of the unit of analysis.  For 
     visualizations we aim to use a scatter plot of year to suicide rates with each
     point being a country as the framework.  From here we can break down the scatter
     plot into multiples by brackets of sex, gdp per capita, or generations.  To put
     the factor of fiscal matters we can substitute the year variable and look at the
     relationship of gdp per capita to suicide rates, and we can break it down into
     multiple plots by brackets of sex, years, or generations.  The final product
     would be simpler than proposed as we hope to present this to the general
     population and to bring awareness to everyone.")
)

# Research question
report_2 <- fluidPage(
  h2("Research Questions"),
  br(),
  p("These are the main questions that we are attempting to answer through our project:"),
  shiny::tags$ol(
    shiny::tags$li("Does gdp per capita affect the suicide rates?"),
    shiny::tags$li("How suicide rates have been changed throughout each generation?"),
    shiny::tags$li("How does sex affect suicide rates?")
  )
)

# dataset

report_3 <- fluidPage(
  h3("Data Sets "),
  h5(tags$a(href="https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-
            to-2016", "Suicide Rates Overview 1985 to 2016")
  ),
  h5("This is data set was uploaded to kaggle by the user Rusty, sourcing from data
     of World Bank, United Nations Development Program, and World Health Organization.
     This data set was pieced together with the article suicide in the Twenty-First 
     Centurys? of user Szamil that did a similar analysis with the data on World
     Health Organizationsdataset of suicide (Rusty).  The data set that has been
     put together here is nothing but suicide preventions? in the eyes of Rusty, and
     in order to contribute to this common goal, we need to analyze the data to find
     trends that could help us understand the situation more to solve the issue."),
     p("In
     the data set each observation is a group of people of a certain generation (age 
     group), either sex, of country, and its suicide rate of a year.  The variables
     of the observations in the data include: country, year, sex, age (grouped), 
     number of suicides of the group, population of the group, suicide percentage of
     the group, country-year (simply for easier sorting), Human Development Index, 
     gdp for year, gdp per capita for year, and generation.  This data does not 
     include those measures of people of intersex which could be that it isns
     properly tracked and is an extreme minor part of population.  There does appear
     to be some missing variables of older data as it couldn't be tracked properly.
     For the dataset we extract from one that will be eliminated the age section as 
     it somewhat overlaps with the category of generation.  It's not exactly 
     synonymous, but we believe that the background people grow up with matters a lot
     more than numbers that might be a bit more accurate -- this would be easier for 
     the general audience as well.:"), 
     p("Another thing is we choose to keep only gdp per 
     capita instead of gdp of the whole country, as the gdp of the whole country does
     not represent the living situation of the people as the size of countries vary a
     lot.  The raw numbers of suicide and population has been removed as the variable
     of suicide per 100,000 ppl is the suicide rate of the group, and shows how
     severe the problem is.  Population might indicate the size of a country and its
     relation to suicide, but that is out of the discussion here.  The Human
     Development Index is missing a lot of data, and will consider to be dropped
     as well.")
)

report_4 <-fluidPage(
  h3("4.0 Information Visualizations "),
  h5("To answer the Research questions, we will use a scatter plot of gdp per capita
     vs suicide rates, with each dot being an observation.  The analysis of this
     would answer research question 1.  To answer research question 2 we would give
     the option to change the colors of the observations by generation; and for
     question 3 we could apply the same concept and change the color by sex.  If the
     observation is missing gdp per capita, it would be eliminated from the
     scatterplot of gdp per capita vs suicide rates.  On the sidebar there would be
     options to show only certain sex, certain generations, etc.")
)

report_5 <- fluidPage(
  h3("5.0 Technical description"),
  p("In order to get a clear and reasonable answer to our research questions, we downloaded a .csv file from kaggle
     that contained over 200 observations and around 12 variables. Each variable in the dataset was important to answering
     the research questions. The major libraries used include the following:"), 
  shiny::tags$ol(
    shiny::tags$li("Shiny "),
    shiny::tags$li("Plotly"),
    shiny::tags$li("dplyr"), 
    shiny::tags$li("ggplot2"),
    shiny::tags$li("kableExtra")
  ),
  p("The User Interface of the application contains 11 pages that are accessible to the viewer. In our app, we 
    created the UI as well as the backend for the necessary query requests with the help of Shiny in RStudio. 
    The apps pages are systematically placed in a coherent manner so as to step-by-step guide the user through the entire
    problem situation and how we intended to derive results from it. For clarity purposes, Interactive Visualizations of data
    were also included within the app. These were made with the help of the kableExtra Library."),
  p("Our code was organized into 3 files: UI.R which contained the code for the User Interface of the application
    , Server.R and app.R. All three were sourced at the same file directory. We were able to collaborate and work 
    simultaneously on the app together by sharing the code on GitHub."),
  p("By conducting our statistical analysis on the dataset we acquired, we were attempting to answer the research questions
    that we had posed earlier with hopes of detecting a pattern or a trend from the data. We manipulated the data sets and
    created visualizations as aids to guide us to a hypothesis.")
)

report_6 <- fluidPage(
  h3("6.0 Conclusion"),
  h5("Strengths and Weaknesses:"),
  p("This application provides an insightful perspective to the several factors that play a role in suicide rates per 
    country. One of the greatest strengths of this project is its vagueness in that aspect. By observing the various aspects
    governing such a heavy and pressing matter of our society and comparing it numerically with other countries,this poject
    really paves way to a lot of new research questions than that of what we we hoped to answer. For instance, by comparing
    the suicide rates across countries, one could raise the question of how a country's traditions and culture could affect
    suicide rates. There are some weaknesses presented in this project as well. Although we do cover a lot of variables
    within our dataset, not all of them are fully utilized within the application, especially in the visualization of the 
    data sections. "), 
  br(), 
  h5("Main Learrning Points:"),
  p("To reflect on what we learned throughout the process, we understood how to deduce trends and patterns in data from
    manipulating a dataset given and presenting their visualization for clearer comprehension. The more we continued to work
    with our dataset, the easier it became for us to pose and answer our research question and base a hypothesis off of it.
    We also learned how to tackle a small-scale data anlaytics project systematically - Coming up with a project
    proposal, understanding the various processes of planning and execution, delegating 
    tasks around as a group and how to achieve efficient results. Another great learning point was understanding to 
    further degree, the nuances behind creating a shiny application with an interactive interface. Through this experience, 
    we were able to wrangle data and manipulate it to higher degrees."), 
  br(), 
  h5("Future Scope:"), 
  p("We do believe that a project covering such a sensitive yet essential topic would be taken to higher levels. As we 
    continue to find answers in the forms of patterns to our research questions, even more questions may arise that could
    be solved by either intergating new datasets or wrangling the current one. Each member of this team has now had 
    a reasonable grasp of the technical side of creating a data wrangling application and this would definitely inspire
    use to utilize our skills in the future on projects of larger-scales.")
)


appendix_1 <- fluidPage(
  fluidRow(
    column(12,
           tableOutput("table")
    )
  )
)

appendix_2 <- fluidPage(
  h2("Reflection"),
  h5("Freezer: I learned how to visualize data using the shiny app. When I first tried
     to set up the connection with ui.file and server.file, I was really frustrated, 
     plus I wasn't very familiar with the shiny app. No matter how many times I read 
     the textbook or even watched the lecture video, I didn't know how to get this 
     project to start. It took me almost half a day to solve the problem of loading the
     plot. At the behest of a friend, I finally understood the shiny app fundamental. I
     hope that in the rest of the project, our team members can help each other out,
     determined not to procrastinate, in the premise of quality assurance, able to
     complete and successfully deliver this project. Data visualization to me has
     endless knowledge. No matter how you display data, there's no right or wrong
   answer to this, though the audience must know what story you are telling."),
 br(),
 h5("Harrison: For me this is one of the first large coding project I've done.
    This project felt a lot harder to get by than it should, perhaps due to lacking
    a group member and everyone has to put in extra work.  Nevertheless, the amount
    of experience in coding with R is there regardless.  Having experience in
    SOC225 which is a similar curriculum with assignments through the quarter + 
    a personal project of the same but on a simpler scale, this class surely lived
    up to its name of helping me learn the technical foundations of R.  On a second
    thought I do find it unfortunate that the class simply went through a project
    for the sake of doing a project when there's so much more to discuss -- when
    another class can spend about 50% of it on Cathy O'Neil's book yet we only have
    it as a supplementary textbook and not used for the majority of the class."),
 br(),
 h5("Kaushal: Through this project, I am gradually understanding how to approach
    the concept of data science, in that the beauty of it is within its vagueness.
    Given a few sets of data, we are able to ask ourselves  meaningful research
    questions and detect trends out of numbers and lines. There were many parts of the
    project I found to be quite difficult at times. Finding and posing research
    questions, obtaining an accurate and useful dataset that matched the criteria and
    manipulating that to answer specific as well as vague questions to name a few. 
    However, this project has been a valuable learning experience for me and now, 
    although I'm not perfect, I know where to start and how to go about the entire 
    process. As a coder, this project has helped me think not only from a logical 
    standpoint but a pattern-detecting and hypothesizing perspective. To write code
    is one thing, but to understand what it is doing and how it is helpful/can
    contribute to more human understanding is what this project is opening my eyes
    to.")
)

appendix_3 <- fluidPage(
  h2("Envisioning Cards Applied"), 
  h4("Consider Children"),
  br(),
  h5("When jumping into the subject of informatics, we've always been told about how
     analyzing the data and such helps us to predict the future, and we settled on a
     topic that inderectly relates to the future of the human species that especially
     impacts the youth, which is suicide."),
  br(),
  h4("Widespread Use"), 
  br(),
  h5("The context of suicide is broad, it's something that can happen to anyone and
      anytime.  If a solution is found it could put an end to the horrors of this social
     issue."),
  br(),
  h4("Crossing national boundaries"),
  br(),
  h5("In this project the topic of countries has been brought into discussion as well, 
     for that we can see in different datasets regarding different countries there are
     fundemental differences, may it be a crisis at that time or inherenet cultural 
     differences.  What's important is that we're able to understand each other and
     be willing to help out each other.")
)


visual_1 <- fluidPage(    
  titlePanel("Suicide Rate vs GDP per Capita"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      selectInput("sex", "Gender",
                  c("All", "male", "female")
      ),
      selectInput("country", "Country: ", countries)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "plot1")
      
    )
  )
)

ages <- unique(suicide_rate$age)

# Use a fluid Bootstrap layout

visual_2 <- fluidPage(    
  # Give the page a title
  titlePanel("Suicide Rate"),
  # Generate a row with a sidebar
  sidebarLayout(      
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("sex2", "Gender:", 
                  c("All", "male", "female")),
      selectInput("country2", "Country: ", countries),
      hr(),
      helpText("Data from Kaggle.")
    ),
    # Create a spot for the barplot
    mainPanel(
      h2("Average suicide rate by Generations"),
      plotOutput("plot2"),
      h2("Suicide Rate by the year"),
      plotOutput("plot3")
    )
  )
)




ui_page <- dashboardPage(
  dashboardHeader(title = "Menu"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "author"),
      menuItem("Introduction  ", tabName = "page_1"),
      menuItem("Research Questions", tabName = "page_2"),
      menuItem("Possible Data Sets ", tabName = "page_3"),
      menuItem("Visualization_1", tabName = "Visualization_1"),
      menuItem("Visualization_2", tabName = "Visualization_2"),
      menuItem("Information Visualizations  ", tabName = "page_4"),
      menuItem("Technical description", tabName = "page_5"),
      menuItem("Conclusion", tabName = "page_6"),
      menuItem("Appendix", tabName = "dictionary"),
      menuItem("Reflection of members", tabName = "reflection"), 
      menuItem("Envisioning cards", tabName = "env")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "author",
             fluidPage(
                h2("Suicide Comparison of Generations"),
                h3("code name: To be or not to be, the generation that reaches the end"),
                box(
                  title = "Members",
                  h5("Harrison Liao; hxliaoay@uw.edu"),
                  br(),
                  h5("Freezer Yang; wfeng98@uw.edu"),
                  br(),
                  h5("Kaushal Bommena; bommek@uw.edu"),
                  br(),
                  h5("- of Info-201: Technical Foundations of Informatics:
                   The Information School, University of Washington, Autumn 2019")
                )
              )
              
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
              ), 
      tabItem(tabName = "env",
              appendix_3
              )
    )
  ) #dashbody end
)
shinyUI(ui_page)


