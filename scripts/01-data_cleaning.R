## Data cleaning ##
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Ziyao Han
# Data: 3 January 2021
# Contact: frank.han@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(readr)
library(tidyverse)
# Read in the raw data.

# Seperator is a semicolon
rawdata<-read.table("inputs/data/winequality-white.csv", sep=";", header=T)

write.csv(rawdata, "inputs/data/cleaned_white_wine.csv")
