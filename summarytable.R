data <- read.csv("Data/120 Years of Olympic History/athlete_events.csv")

table <- data %>%
  group_by(Team) %>%
  filter(!is.na(Medal)) %>%
      summarize(medal_count = n()) %>%
      arrange(-medal_count) %>%
      head(20)
