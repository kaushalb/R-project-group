
```{r}
suicide_rate <- read.csv("master.csv", fileEncoding = "UTF-8-BOM")
df <-suicide_rate
colnames(df)
```


```{r}
gg <- df$country
gg
```
```{r}
 suicide_rate <- read.csv("master.csv",  fileEncoding = "UTF-8-BOM")
    df <-suicide_rate %>%
      select(country, year, gdp_per_capita, suicides_per_100k_pop, sex, generation
             )
    plot_1 <-  ggplot(data = df, aes(x = df$gdp_per_capita, y = df$suicides_per_100k_pop, color = df$sex)) + 
      geom_point()
plot_1
```

```{r}
 suicide_rate <- read.csv("master.csv")
    df <-suicide_rate
plot_2 <-  ggplot(data = df, aes(x = df$gdp_per_capita, y = df$suicides_per_100k_pop, color = df$generation)) + 
      geom_point() + facet_wrap(~df$generation)
plot_2
```

