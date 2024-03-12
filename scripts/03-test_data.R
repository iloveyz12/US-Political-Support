#### Preamble ####
# Purpose: Tests on analysis data
# Authors: Zheng(Zeb) Yang, Dongli Sun, Bernice(Yixuan) Bao
# Contact: zhengzeb.yang@mail.utoronto.ca, dongli.sun@mail.utoronto.ca, bernice.bao@mail.utoronto.ca
# Pre-requisites: -


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####
ces2022 <-
  read_csv(
    here::here("data/analysis_data/analysis_data1.csv"))

ces2022

test_that("Check class", {
  expect_type(ces2022$voted_for, "character")
  expect_type(ces2022$gender, "character")
  expect_type(ces2022$education, "character")
  
})



test_that("Check complete", {
  expect_true(all(complete.cases(ces2022)))
})


test_that("Check variable",{
  expect_setequal(ces2022$voted_for, c("Biden", "Trump"))
  expect_setequal(ces2022$gender, c("Man", "Woman", "Non-binary", "Other"))
  expect_setequal(ces2022$education, c("No HS", "High school graduate", "Some college", "2-year", "4-year", "Post-grad"))
})    
