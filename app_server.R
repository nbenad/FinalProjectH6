# Interactive boxplot of height and weight by sport
server <- function(input, output) {
  output$boxplot <- renderPlot({
    #  Title  of boxplot
    title <- paste("Height of Olympic", input$sport, "Athletes")
    # Boxplot code
    boxplot <- ggplot(data) +
      geom_boxplot(mapping = aes(x = input$sport, y = data$Height)) +
      labs(x = "Sport", y = "Height (cm)")
    boxplot
  })
}

# Sports is input with Select Box
# x_var is height or weight

