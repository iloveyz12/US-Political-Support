#### Preamble ####
# Purpose: Models on analysis data
# Authors: Zheng(Zeb) Yang, Dongli Sun, Bernice(Yixuan) Bao
# Contact: zhengzeb.yang@mail.utoronto.ca, dongli.sun@mail.utoronto.ca, bernice.bao@mail.utoronto.ca
# Pre-requisites: -


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

set.seed(812)

analysis_data <- 
  ces2022 |> 
  slice_sample(n = 1000)


### Model data ####
first_model <-
  stan_glm(
    formula = voted_for ~ gender + education,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 812
  )

prior_summary(first_model)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)
