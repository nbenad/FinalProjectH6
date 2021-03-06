library(dplyr)
library(stringr)
library(leaflet)
library(ggplot2)
library(tidyr)
library(reshape2)

df <- read.csv("Data/120 Years of Olympic History/athlete_events.csv",
               stringsAsFactors = FALSE)

coutries_bronze_count <- df %>%
  select(Team, Sport, Medal) %>%
  filter(!is.na(Medal)) %>%
  group_by(Team, Sport) %>%
  filter(Medal == "Bronze") %>%
  summarize(Bronze_Count = n()) %>%
  arrange(Sport)


coutries_silver_count <- df %>%
  select(Team, Sport, Medal) %>%
  filter(!is.na(Medal)) %>%
  group_by(Team, Sport) %>%
  filter(Medal == "Silver") %>%
  summarize(Silver_Count = n()) %>%
  arrange(Sport)


coutries_gold_count <- df %>%
  select(Team, Sport, Medal) %>%
  filter(!is.na(Medal)) %>%
  group_by(Team, Sport) %>%
  filter(Medal == "Gold") %>%
  summarize(Gold_Count = n()) %>%
  arrange(Sport)

coutries_count <- df %>%
  select(Team, Sport, Medal) %>%
  filter(!is.na(Medal)) %>%
  group_by(Team, Sport) %>%
  summarize(Count = n()) %>%
  arrange(Sport)

aggregated_table <- coutries_bronze_count %>%
  left_join(coutries_silver_count) %>%
  left_join(coutries_gold_count) %>%
  replace_na(list(Silver_Count = 0, Gold_Count = 0)) %>%
  mutate(score = Bronze_Count + Silver_Count * 2 + Gold_Count * 3)

top_country <- aggregated_table %>%
  group_by(Team) %>%
  summarize(sum_score = sum(score)) %>%
  arrange(-sum_score) %>%
  slice_head(n = 40)

best_sports <- function(cn) {
  return(aggregated_table %>%
            filter(Team == cn) %>%
            arrange(-score) %>%
            select(Team, Sport, Bronze_Count, Silver_Count, Gold_Count) %>%
            slice_head(n = 5))
  }

result <- function(cn) {
  c_best <- best_sports(cn)
  mdf <- melt(c_best)
  return(ggplot(data = mdf, aes(x = Sport, y = value, fill = variable)) +
           geom_col(position = "dodge") +
           labs(title = paste0("Top 5 best performed sports by ", c_best$Team[1])) +
           geom_text(aes(label = value), position = position_dodge(width = 0.9)))
}

# c_list <- vector(mode = "list", length = 0)
# for (cn in top_country$Team) {
#   c_list[[cn]] <- best_sports(cn)
#   }
# 
# melt_plot <- function(df) {
#   mdf <- melt(df)
#   return(ggplot(data = mdf, aes(x = Sport, y = value, fill = variable)) +
#     geom_col(position = "dodge") +
#     labs(title = paste0("Top 5 best performed sports by ", df$Team[1])) +
#     geom_text(aes(label = value), position = position_dodge(width = 0.9)))
# }
# 
# plot_list <- vector(mode = "list", length = 0)
# for (cn in top_country$Team) {
#   plot_list[[cn]] <- melt_plot(c_list[[cn]])
# }
# 
# print(plot_list$`United States`)
# print(plot_list$`Soviet Union`)
# print(plot_list$Germany)

