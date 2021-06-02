# Interactive boxplot of height and weight by sport
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
      labs(x = "Sport", y = "Height (cm)")
    boxplot
  })
}

# Sports is input with Select Box
# x_var is height or weight

