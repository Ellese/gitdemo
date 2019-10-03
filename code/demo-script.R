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

lakers <- dat %>%
  filter(team == "LAL") %>%
  arrange(salary)

write.csv(warriors, 
          file = "data/warriors.csv", 
          row.names = FALSE)

sink(file = "output/data-structure.txt")
str(dat)
sink()

sink(file = "output/summary-warriors.txt")
summary(warriors)
sink()

sink(file = "output/summary-lakers.txt")
summary(lakers)
sink()

jpeg(file = "images/histogram-age.jpeg",
     width = 600, height = 400)
hist(dat$age)
dev.off()

jpeg(file = "images/scatterplot2-height-weight.jpeg",
     width = 600, height = 400,
     pointsize = 15)
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off()

ggplot(dat) + 
  geom_point(aes(x = dat$height, y = dat$weight)) +
  facet_grid(vars(dat$position))
ggsave(filename = "images/height_weight_by_position.pdf")