page_two <- fluidPage(
  "Heights of Olympic Athletes",
  sidebarLayout(
    h2("How tall are different sport Athletes"),
    selectInput(inputId = "sport",
                label = h3("Sport?"),
                choices = unique(data$Sport))),
  mainPanel(
    plotOutput(
      outputId = "boxplot")
    )
  )


ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(title =
  "Olympic Athlete Data",
  tabPanel("Heights",page_two)))
