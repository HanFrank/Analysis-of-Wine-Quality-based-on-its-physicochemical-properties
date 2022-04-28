## Simulating Data ##

library(tidyverse)

# Setting a seed for reproducibility
set.seed(100)


# Simulating a potential desired dataset 
# Data is roughly normal so we're going to assume a normal distribution
# Taking mean and sd from the original variable we have a somewhat similar results
# Assuming quality score is randomly sampled from 1-10

white_wine <- read_csv(here::here("inputs/data/cleaned_white_wine.csv"))

simulated_data <- tibble(
  alcohol = rnorm(n=100, mean = mean(white_wine$alcohol), sd = sd(white_wine$alcohol)),
  pH = rnorm(n=100, mean = mean(white_wine$pH), sd = sd(white_wine$pH)),
  sulphates = rnorm(n=100, mean = mean(white_wine$sulphates), sd = sd(white_wine$sulphates)),
  residual.sugar = rnorm(n=100, mean = mean(white_wine$residual.sugar), sd = sd(white_wine$residual.sugar)),
  quality = sample(c(1:10), size = 100, replace = TRUE)
)

# Fixing negative values of sugar because that's not possible
simulated_data$residual.sugar <- ifelse(simulated_data$residual.sugar < 0, 0, simulated_data$residual.sugar)

# A potential limitation with this simulation is that it does not account for multicollinearity between the variables.
# Some variables may be associated such as citric acid and pH.