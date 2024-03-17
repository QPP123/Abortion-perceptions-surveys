#### Preamble ####
# Purpose: Cleans the raw data from GSS and remove useless options
# Author: Kuiyao Qiao
# Date: 13th March 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: R 4.3.2, GSS.xlsx

#### Workspace setup ####
library(readxl)
library(dplyr)
library(tidyr)
library(here)

#### Clean data ####
#Read the data from an Excel file
file_path <- here("inputs", "data", "raw_data", "GSS.xlsx")
raw_data <- read_excel(file_path)

## Clean data, starting from third column, convert values that are not "yes" or "no" to NA
cleaned_data <- raw_data %>%
  mutate(across(.cols = 3:ncol(.), ~if_else(. %in% c("YES", "NO"), ., NA_character_)))

#### Save data ####
## Save the cleaned data to a CSV file
output_path <- here("inputs", "data", "analysis_data", "analysis_data.csv")
write.csv(cleaned_data, output_path, row.names = FALSE)