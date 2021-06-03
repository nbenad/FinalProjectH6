##
library(dplyr)
library(ggplot2)

top_medal_percentages <- function(df, startYear = 1896, endYear = 2016) {
  medal_percentage_data <- df %>%
    filter(Year >= startYear & Year <= endYear) %>%
    group_by(Year, Season, region, Medal) %>%
    summarise(TempCnt = n()) %>%
    group_by(Year, Season, region) %>%
    summarise(RegionMedalPct = sum(TempCnt[!is.na(Medal)]) / sum(TempCnt))
  top_regions <- medal_percentage_data %>%
    group_by(region) %>%
    summarise(TotalPct = sum(RegionMedalPct)) %>%
    top_n(5, TotalPct)
  graph_data <- inner_join(medal_percentage_data, top_regions)
  graph <- ggplot(graph_data, aes(x = Year,
                                  y = RegionMedalPct, colour = region)) +
    geom_line(size = 1.5) +
    ylab("Percentage") +
    ggtitle("Percentage of Competing Athletes Who Medaled Grouped By Country") +
    facet_grid(rows = vars(Season))
}
