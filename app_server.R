# Interactive boxplot of height and weight by sport
server <- function(input, output) {
  output$boxplot <- renderPlot({
    #  Title  of boxplot
    title <- paste(input$x_var, "of Olympic", input$y_var, "Athletes")
    # Boxplot code
    boxplot <- ggplot(data) +
      geom_boxplot(mapping = aes(x = input$x_var, y = input$y_var))
    boxplot
  })
}

