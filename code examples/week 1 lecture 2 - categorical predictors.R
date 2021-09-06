library(palmerpenguins)
library(fastDummies)
library(tidyverse)

# create penguin data
data <- as_tibble(penguins %>% select(species, bill_length_mm, flipper_length_mm))

# how many species?
data %>% count(species)

# create dummy variables
data <- dummy_cols(data, select_columns = c("species"))
# note that we do not need the c() for a single variable, however,
# you can include more than one variable in the c() function

# model bill length as a function of flipper length and species
# leave out Adelie as reference group
m1 <- lm(bill_length_mm ~ flipper_length_mm + species_Chinstrap + species_Gentoo, data = data)

summary(m1)

data %>% group_by(species) %>% summarize(mean = mean(bill_length_mm, na.rm = TRUE))
