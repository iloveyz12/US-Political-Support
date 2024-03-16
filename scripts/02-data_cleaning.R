#### Preamble ####
# Purpose: Cleans the raw plane data 
# Authors: Zheng(Zeb) Yang, Dongli Sun, Bernice(Yixuan) Bao
# Contact: zhengzeb.yang@mail.utoronto.ca, dongli.sun@mail.utoronto.ca, bernice.bao@mail.utoronto.ca
# Pre-requisites: -

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
ces2022 <-
  read_csv(
    here::here("data/raw_data/ces2022.csv"),
    col_types =
      cols(
        "votereg" = col_integer(),
        "presvote20post" = col_integer(),
        "gender4" = col_integer(),
        "educ" = col_integer()
      )
  )

ces2022


ces2022 <-
  ces2022 |>
  filter(votereg == 1,
         presvote20post %in% c(1, 2)) |>
  mutate(
    voted_for = if_else(presvote20post == 1, "Biden", "Trump"),
    voted_for = as_factor(voted_for),
    gender = case_when(
      gender4 == 1 ~ "Man", 
      gender4 == 2 ~ "Woman", 
      gender4 == 3 ~ "Non-binary", 
      gender4 == 4 ~ "Other"),
    education = case_when(
      educ == 1 ~ "No HS",
      educ == 2 ~ "High school graduate",
      educ == 3 ~ "Some college",
      educ == 4 ~ "2-year",
      educ == 5 ~ "4-year",
      educ == 6 ~ "Post-grad"
    ),
    education = factor(
      education,
      levels = c(
        "No HS",
        "High school graduate",
        "Some college",
        "2-year",
        "4-year",
        "Post-grad"
      )
    )
  ) |>
  select(voted_for, gender, education)


#### Save data ####
write_parquet(ces2022, "data/analysis_data/analysis_data.parquet")
write.csv(ces2022, "data/analysis_data/analysis_data.csv")
