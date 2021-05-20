## File with a function that returns a boxplot chart of athlete's heights
library(dplyr)
library(ggplot2)
library(forcats)

athlete_df <- read.csv("Data/120 Years of Olympic History/athlete_events.csv")

athlete_height <- function(dataset) {
  dataset$Medal[is.na(dataset$Medal)] <- "Didn't Medal"
  plot <- ggplot(data = dataset) +
    geom_boxplot(mapping = aes(x = Medal, y = Height)) +
    scale_x_discrete(limits = c("Gold", "Silver", "Bronze", "Didn't Medal")) +
    labs(title = "Heights and Medals of Olympic Athletes")
  return(plot)
}

