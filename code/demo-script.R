# ===================================================================
# Title: Demo Script for R
# Description: This is just a demo script for Lab05 in STAT133
# Inputs: NA
# Outputs: NA
# Author: Ellese Nguyen
# Date: 10-3-2019
# ===================================================================

library(dplyr)
library(ggplot2)

dat <- read.csv("data/nba2018-players.csv")

warriors <- dat %>%
  filter(team == "GSW") %>%
  arrange(salary)

write.csv(warriors, 
          file = "data/warriors.csv", 
          row.names = FALSE)
