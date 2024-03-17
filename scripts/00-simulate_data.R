#### Preamble ####
# Purpose: Simulates a random number of voters and results
# Author: Kuiyao Qiao
# Date: 13th March 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# This setup will create a structured tabular dataset where each row represents a survey response for a given year and respondent ID, and the responses are recorded in the survey_respondents column. This dataset is constructed to reflect a possible scenario in the GSS where a certain number of respondents from different years answer "yes", "no", or "none" in response to a survey question. However, the number of people tested was reduced to keep the data data streamlined.

set.seed(1688) # For reproducibility
years <- 1972:2022 # Create a sequence of years from 1972 to 2022.
years <- sort(sample(years, length(years), replace = FALSE)) # Randomly sample from these years without replacement, ensuring that each year in the resulting year vector is unique, and then sort in ascending order.
num_people <- sample(50:100, 1) # Choose a random value between 50 and 100 to determine the number of people or records in the modelled data set.
ids <- 1:num_people # Generate a string of numbers from 1 to num_people as a unique identifier for each record or person in the dataset.
surveyrespondents <- sample(c("YES", "NO", "NONE"), num_people, replace = TRUE) # Responses are randomly selected from the "yes", "no" and "none" options in num_people, allowing for substitution, which means that the same response can be selected more than once for different people.

data <- data.frame(year = rep(years, length.out = num_people),# Repeats the year vector to match the total number of people. If num_people is greater than the length of the year, it loops through the year vector until num_people is reached.
                   id = ids,
                   survey_respondents = surveyrespondents)