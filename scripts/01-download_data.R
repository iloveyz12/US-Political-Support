#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Authors: Zheng(Zeb) Yang, , Bernice(Yixuan) Bao
# Contact: zhengzeb.yang@mail.utoronto.ca, , bernice.bao@mail.utoronto.ca
# Pre-requisites: -



#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####
ces2020 <-
  get_dataframe_by_name(
    filename = "CCES22_Common_OUTPUT_vv_topost.csv",
    dataset = "10.7910/DVN/PR4L8P",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, CC20_410, gender, educ)



#### Save data ####
write_csv(ces2020, "data/raw_data/ces2020.csv")

         
