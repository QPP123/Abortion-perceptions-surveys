#### Preamble ####
# Purpose: Simulates a random number of voters and results
# Author: Kuiyao Qiao
# Date: 13th March 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(1688)
years <- setdiff(1972:2022, c(1979, 2007, 2009, 2011, 2013, 2015, 2017, 2019, 2020))
years <- sort(sample(years, length(years), replace = FALSE))
num_people <- sample(50:100, 1)
ids <- 1:num_people
votes <- sample(c("YES", "NO", "NONE"), num_people, replace = TRUE)
data <- data.frame(year = rep(years, length.out = num_people),
                   id = ids,
                   vote = votes)
write.csv(data, "00-simulate_data.csv", row.names = FALSE)