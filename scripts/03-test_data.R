#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Kuiyao Qiao
# Date: 13th March 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT
# Pre-requisites:   # 00-simulate_data.R
                    # 01-download_data.R
                    # 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)
library(here)

#### Test data ####
# Define the path
data_path <- here("inputs", "data", "analysis_data", "analysis_data.csv")

# Load the dataset
data <- read_csv(data_path)

#Test 1: Years sorted and non-negative in the year column
test_1_sorted_and_non_negative <- function(df) {
  year_column_name <- names(df)[which(sapply(df, is.numeric))[1]] # Assuming the first numeric column is 'year'
  sorted <- all(diff(df[[year_column_name]]) >= 0) # Check if sorted in ascending order
  non_negative <- all(df[[year_column_name]] >= 0) # Check for non-negative values
  sorted && non_negative
}

#Test 2: Years from 1972 to 2022
test_2_years_range <- function(df) {
  year_column_name <- names(df)[which(sapply(df, is.numeric))[1]] # Assuming the first numeric column is 'year'
  within_range <- all(df[[year_column_name]] >= 1972 & df[[year_column_name]] <= 2022)
  within_range
}

#Test 3: Rows after the second line "YES", "NO", or NA from the third column
test_3_valid_responses <- function(df) {
  valid_responses <- c("YES", "NO", NA)
  checks <- lapply(df[, 3:ncol(df)], function(column) {
    all(is.na(column) | column %in% valid_responses)
  })
  all(unlist(checks))
}

#Test 4: No lowercase "yes" or "no"
test_4_no_lowercase <- function(df) {
  checks <- lapply(df[, 3:ncol(df)], function(column) {
    sum(grepl("yes|no", column, ignore.case = FALSE)) == 0
  })
  all(unlist(checks))
}

# Execute tests
test_1_result <- test_1_sorted_and_non_negative(data)
test_2_result <- test_2_years_range(data)
test_3_result <- test_3_valid_responses(data)
test_4_result <- test_4_no_lowercase(data)
