page_two <- fluidPage(
  tags$h1(id = "boxplot_header1","Heights of Olympic Athletes"),
  sidebarLayout(
    tags$h2(id = "boxplot_header2","How tall are Athletes based off of their Sport?"),
    selectInput(inputId = "sport",
                label = tags$h3(id = "boxplot_header3","Select sport of intetest"),
                choices = unique(data$Sport))),
  p("This Boxplot dispalys the heights of olympic athletes based off of the
  sport they compete in. Notably we can see how the distribution of athlete's
  heights change as the sport of interest is adjusted."),
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
