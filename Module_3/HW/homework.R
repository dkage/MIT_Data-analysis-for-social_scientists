# Includes
library(utils)
library(tidyverse)
library(ggplot2)

# Question 1 - Remove all current objects
rm(list=ls())


# Question 2 - Row = country/region + indicator
#Getting the data
gender_data <- as_tibble(read.csv("Gender_StatsData.csv"))

head(gender_data)
tail(gender_data)
dim(gender_data)


# Question 3 - subset() = filter()
# Base R function
subset(gender_data, Indicator.Code == 'SP.ADO.TFRT')

# Using filter
teenager_fr <- filter(gender_data, Indicator.Code == "SP.ADO.TFRT")


# Question 4
rm(gender_data)


# Question 5
# Statistics of teenager_fr
summary(teenager_fr$X1975)
# Needs to remove N/A values or mean goes to zero
mean(teenager_fr$X1975, na.rm = TRUE)
mean(teenager_fr$X1975)


# Question 6
mean(teenager_fr$X1960, na.rm = TRUE)
sd(teenager_fr$X1960, na.rm = TRUE)


# Question 7
mean(teenager_fr$X2000, na.rm = TRUE)
sd(teenager_fr$X2000, na.rm = TRUE)


# Qurestion 8
# Trend is down but not always


# Question 9
byincomelevel <- filter(teenager_fr,Country.Code%in%c("LIC","MIC","HIC", "WLD"))
byincomelevel


# Question 10
gather(byincomelevel, Year, FertilityRate, X1960:X2015)
plotdata_bygroupyear <- gather(byincomelevel, Year, FertilityRate, X1960:X2015) %>% select(Year, Country.Name, Country.Code, FertilityRate)


# Question 11
plotdata_bygroupyear
plotdata_byyear <- select(plotdata_bygroupyear, Country.Code, Year, FertilityRate) %>%
                    spread(Country.Code, FertilityRate)
plotdata_byyear


# Question 12

# if true
plotdata_byyear <- plotdata_bygroupyear %>%
  spread(Country.Code, FertilityRate)
plotdata_byyear

# if false
plotdata_byyear <- select(plotdata_bygroupyear, Country.Code, Year, FertilityRate) %>%
  spread(Country.Code, FertilityRate)
plotdata_byyear


# Question 13 & 14 & 15
ggplot(plotdata_bygroupyear, aes(x=Year, y=FertilityRate, group=Country.Code, color=Country.Code)) + geom_line() + labs(title='Fertility Rate by Country-Income-Level over Time')


# Question 16

# recreates from question 10
plotdata_bygroupyear <- gather(byincomelevel, Year, FertilityRate, X1960:X2015) %>% select(Year, Country.Name, Country.Code, FertilityRate)

# Possible options all correct 
plotdata_bygroupyear <- mutate(plotdata_bygroupyear,Year=as.numeric(str_sub(Year, -4)))
plotdata_bygroupyear <- mutate(plotdata_bygroupyear,Year=as.numeric(str_sub(Year, 2, 5)))
plotdata_bygroupyear <- mutate(plotdata_bygroupyear,Year=as.numeric(str_replace(Year, "X", "")))
# Plots correctly
ggplot(plotdata_bygroupyear, aes(x=Year, y=FertilityRate, group=Country.Code, color=Country.Code)) + geom_line() + labs(title='Fertility Rate by Country-Income-Level over Time')
 

