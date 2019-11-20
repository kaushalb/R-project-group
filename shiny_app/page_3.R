report_3 <- fluidPage(
  h3("3.0 Data Sets "),
  h5(tags$a(href="https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-
         to-2016", "Suicide Rates Overview 1985 to 2016")
  ),
  h5("This is data set was uploaded to kaggle by the user Rusty, sourcing from data
  of World Bank, United Nations Development Program, and World Health Organization.
    This data set was pieced together with the article “Suicide in the Twenty-First 
    Century” of user Szamil that did a similar analysis with the data on World
    Health Organization’s dataset of suicide (Rusty).  The data set that has been
    put together here is nothing but “suicide prevention” in the eyes of Rusty, and
    in order to contribute to this common goal, we need to analyze the data to find
    trends that could help us understand the situation more to solve the issue.  In
    the data set each observation is a group of people of a certain generation (age 
    group), either sex, of country, and its suicide rate of a year.  The variables
    of the observations in the data include: country, year, sex, age (grouped), 
    number of suicides of the group, population of the group, suicide percentage of
    the group, country-year (simply for easier sorting), Human Development Index, 
    gdp for year, gdp per capita for year, and generation.  This data does not 
    include those measures of people of intersex which could be that it isn’t 
    properly tracked and is an extreme minor part of population.  There does appear
    to be some missing variables of older data as it couldn’t be tracked properly.
    For the dataset we extract from one that will be eliminated the age section as 
    it somewhat overlaps with the category of generation.  It’s not exactly 
    synonymous, but we believe that the background people grow up with matters a lot
    more than numbers that might be a bit more accurate -- this would be easier for 
    the general audience as well.  Another thing is we choose to keep only gdp per 
    capita instead of gdp of the whole country, as the gdp of the whole country does
    not represent the living situation of the people as the size of countries vary a
    lot.  The raw numbers of suicide and population has been removed as the variable
    of suicide per 100,000 ppl is the suicide rate of the group, and shows how
    severe the problem is.  Population might indicate the size of a country and its
    relation to suicide, but that is out of the discussion here.  The Human
    Development Index is missing a lot of data, and will consider to be dropped
    as well.")
)