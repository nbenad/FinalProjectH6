library(dplyr)

data <- read.csv("/Users/JackTheSon1/Desktop/GitHub/FinalProjectH6/Data/120 Years of Olympic History/athlete_events.csv")

total_ath <- length(unique(data$Name))

total_events <- length(unique(data$Event))
total_sports <- length(unique(data$Sport))

unique_city <- data %>% group_by(City) %>% 
      summarize(Hosted = length(unique(Year))) %>% 
      arrange(-Hosted) %>% 
      nrow()

two_host <- data %>% group_by(City) %>% 
      summarize(Hosted = length(unique(Year))) %>% 
      arrange(-Hosted) %>% 
      filter(Hosted > 1) %>% 
      nrow()

three_host <- data %>% group_by(City) %>% 
      summarize(Hosted = length(unique(Year))) %>% 
      arrange(-Hosted) %>% 
      filter(Hosted > 2) %>% 
      nrow()

male <- data %>% filter(Sex == "M") %>% 
      group_by(Name) %>% 
      summarize(Appearances = n()) %>% 
      nrow / total_ath * 100
male <- round(male, digits = 1)


female <- data %>% filter(Sex == "F") %>% 
      group_by(Name) %>% 
      summarize(Appearances = n()) %>% 
      nrow / total_ath * 100 
female <- round(female, digits = 1)

medals <- data %>% group_by(Medal) %>% summarize(total = n()) %>% filter(!is.na(Medal))
sum_medal <- sum(medals$total)
