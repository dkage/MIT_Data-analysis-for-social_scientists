# Import
library(tidyverse)

# Clear workspace
rm(list = ls())

# Setting project path
path = ("/Users/danilo/R/Module_1");
setwd(path);
getwd();

# Question 12
print("Hello World!")

# Question 13
z <- c(pi, 205, 149, -2)
y <- c(z, 555, z)
y <- 2 * y + 760
my_sqrt <- sqrt(y - 1)

# What contains
length(my_sqrt)
# my_sqrt ===> length 9 vector


# Question 14
print(0/0)
# NaN


# Question 15
my_sqrt[10] # == NA
print(my_sqrt[10] + 1)
# add number to NA = NA


# Question 16
age <- c(12, 28, 35, 27, NA, 25, 32, 45, 31, 23, NA, 34)

# Correct answers:
# (remove NA and show only valid numbers)
age[-c(5, 11)]
age[c(-5, -11)]
age[c(1, 2, 3, 4, 6, 7, 8, 9, 10, 12)]
age[!is.na(age)]

#############################################
###### CSV load for 17, 18, 19, 20, 21 ###### 
papers <- as_tibble(read_csv("R/Module_1/CitesforSara.csv"))


# Question 17
papers_select <- select(papers, journal, year, cites, title, au1)


# Question 18
filter(papers_select, cites >= 100) # 205


# Question 19
journals_group <- group_by(papers,journal)
summarized_journal <- summarize(journals_group, sum(cites))
filter(summarized_journal, journal == "Econometrica")
# 75789 sum


# Question 20
n_distinct(papers$au1)


# Question 21
papers_female <- select(papers, contains("female"))


