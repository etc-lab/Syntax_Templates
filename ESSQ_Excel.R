### Exercise Self-Schema ###


## 1 Set working Directory
# Click SESSION -> Set working directory -> Choose Directory -> find file
# OR, use this code 
# setwd("C:/Users/jadam/Desktop")

## 2 Import library. If not already installed then install:
# install.packages("dplyr")
# install.packages("openxlsx")
library(openxlsx)
library(dplyr)

## 3 Importing the dataset and identifies -999 as missing value
dataset <- read.xlsx('ESSQ.xlsx', colNames = TRUE)

## 4 Run Exercise Self-Schema Coding
dataset <- dataset %>%
  rowwise() %>%
  mutate(Category = if((sum(Q1 > 7, Q4 > 7, Q7 > 7) >= 2 & sum(Q3 > 7, Q6 > 7, Q9 > 7) >= 2)){
                            "Exercise Schematic"
  } else if((sum(Q1 < 5, Q4 < 5, Q7 <5) >= 2 & sum(Q3 > 7, Q6 > 7, Q9 > 7) >= 2)){
                            "Non Schematic"
  } else if((sum(Q1 > 4 & Q1 < 8, Q4 > 4 & Q4 < 8, Q7 > 4 & Q7 < 8) >= 2 & sum(Q3 < 8, Q6 < 8, Q9 < 8) >= 2)){
                            "Aschematic"
  } else {"Unclassified"})

## 5 Save the xlsx file
write.xlsx(dataset, 'ESSQ.xlsx')
