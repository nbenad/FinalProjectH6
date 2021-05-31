page_two <- tabPanel(
  "Heights of Olympic Athletes",
  fluidPage(
    h2("How tall are different sport Athletes"),
    selectInput(inputId = "sport",
                label = h3("Sport?"),
                choices = unique(data$Sport)),
    plotOutput(
      outputId = boxplot
    )
  )
)

ui <- navbarPage(
  "Olympic Athlete Data",
  page_two
)
