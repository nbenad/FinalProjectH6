# Interactive boxplot of height and weight by sport
data <- read.csv("Data/120 Years of Olympic History/athlete_events.csv")
height_data <- data %>%
  group_by(Sport) %>%
  summarise(Height) %>%
  na.omit()

server <- function(input, output) {
  output$boxplot <- renderPlot({
    #  Title  of boxplot
    title <- paste("Height of Olympic", input$sport, "Athletes")
    # Boxplot data
    boxplot_data <- height_data %>% filter(Sport == input$sport)
    # Boxplot code
    boxplot <- ggplot(data = boxplot_data) +
      geom_boxplot(mapping = aes(x = Sport, y = Height)) +
      labs(title = "Athlete's Heights", x = "Sport", y = "Height (cm)")
    boxplot
  })
}
