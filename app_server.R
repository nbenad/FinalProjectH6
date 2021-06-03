data <- read.csv("Data/120 Years of Olympic History/athlete_events.csv")
regions_data <- read.csv("Data/120 Years of Olympic History/noc_regions.csv")

# Country Chart
source("Country_Specialization.R")

# Line Graph
source("WinPercentageByCountryChart.R")

server <- function(input, output) {
  output$boxplot <- renderPlotly({
    # Interactive boxplot of height and weight by sport
    height_data <- data %>%
      group_by(Sport) %>%
      summarise(Height) %>%
      na.omit()
    
    #  Title  of boxplot
    title <- paste("Height of Olympic", input$sport, "Athletes")
    # Boxplot data
    boxplot_data <- height_data %>%
      filter(Sport == input$sport)
    # Boxplot code
    boxplot <- ggplot(data = boxplot_data) +
      geom_boxplot(mapping = aes(x = Sport, y = Height)) +
      labs(title = "Athlete's Heights", x = "Sport", y = "Height (cm)")
    # Make Boxplot interactive with Plotly
    boxplot_int <- ggplotly(boxplot)
    # Return interactive graph
    boxplot_int
  })
  
  output$country_chart <- renderPlotly({
    ggplotly(result(input$country))
  })
  
  output$linegraph <- renderPlotly({
    df <- full_join(data, regions_data)
    ggplotly(top_medal_percentages(df, input$yearSlider[1], input$yearSlider[2]))
  })
}
