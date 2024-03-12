#### Preamble ####
# Purpose: Simulates data on 
# Authors: Zheng(Zeb) Yang, Dongli Sun, Bernice(Yixuan) Bao
# Contact: zhengzeb.yang@mail.utoronto.ca, dongli.sun@mail.utoronto.ca, bernice.bao@mail.utoronto.ca
# Pre-requisites: -


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(812)

num_obs <- 1000

us_political_preferences <- tibble(
  education = sample(0:4, size = num_obs, replace = TRUE),
  gender = sample(1:4, size = num_obs, replace = TRUE),
  support_prob = ((education + gender) / 5),
) |>
  mutate(
    supports_biden = if_else(runif(n = num_obs) < support_prob, "yes", "no"),
    education = case_when(
      education == 0 ~ "< High school",
      education == 1 ~ "High school",
      education == 2 ~ "Some college",
      education == 3 ~ "College",
      education == 4 ~ "Post-grad"
    ),
    gender = case_when(
      gender == 1 ~ "Man", 
      gender == 2 ~ "Woman", 
      gender == 3 ~ "Non-binary", 
      gender == 4 ~ "Other")
  ) |>
  select(-support_prob, supports_biden, gender, education)

write.csv(us_political_preferences, "data/simulated_data/simulated_data.csv")

