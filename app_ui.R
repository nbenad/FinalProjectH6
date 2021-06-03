page_one <- fluidPage(
  tags$h1(id = "title", "Overview and Major Questions:"),
  HTML('<center><img id = "olympic_img", src =
       "https://www.desktopbackground.org/download/2520x1080/2010/07/17/49645_logo-olympic-games-sport-wallpapers-hd-free-des_2560x1600_h.jpg"></center>'),
  tags$p("When working on this project, our group has
  set out to answer a few
        interesting questions about the long and storied
        history of the worldwide Olympics.
        Specifically, we have narrowed our focus to two
        major fields, the athletes themselves
        and  the countries they were competing for. Here
         are our major focus points:"),
  tags$li("How do athletes' heights vary between sports,
          and how important is it to their success?"),
  tags$li("In what specific sports has a country performed
          the best at in its history of competition?"),
  tags$li("Which countries have historically performed
          the greatest, and how has it changed over time?"),
  tags$br(),
  tags$p("In this project, we hope to uncover interesting
  and compelling information about the
         historic and much-revelled Olympic Games.
         Our data was collected by Randi Griffin, a
         data scientist in Cambridge, Massachusetts.
         The data contains information regarding
         athletes in olympic events dating back 120 years."),
  HTML('<center> <img id = "gif1",
       src = "https://i.gifer.com/JOfE.gif"> </center>'),
  tags$p("Let's take a look!")
)

page_two <- fluidPage(
  tags$h1(id = "boxplot_header1", "Heights of Olympic Athletes"),
  sidebarLayout(
    tags$h2(id = "boxplot_header2",
            "How tall are Athletes based off of their Sport?"),
    selectInput(inputId = "sport",
                label = tags$h3(id = "boxplot_header3",
                                "Select sport of intetest"),
                choices = unique(data$Sport))),
  p("This Boxplot dispalys the heights of olympic athletes based off of the
  sport they compete in. Notably we can see how the distribution of athlete's
  heights change as the sport of interest is adjusted. A key take-away is that
  we can see how athletes' heights vary with the sport they partake in."),
  mainPanel(
    plotlyOutput(
      outputId = "boxplot")
    )
  )


# Country Chart
source("Country_Specialization.R")
page_three <- fluidPage(
  tags$h1(id = "barchart_header1", "Countries' Specialization"),
  sidebarLayout(
    tags$h2(id = "barchart_header2", "What
            are the Best Performed Sports by each Country?"),
    selectInput(inputId = "country",
                label = tags$h3(id = "barchart_header3", "Select country name"),
                choices = top_country$Team)),
  p("The barcharts showing each country's best sports illustrates the respective
    country's strengths. A total of 40 countries can be selected, and the order
    from the drop down is sorted by medal counts
    of all sports won by the respective
    coutry (gold medals have larger weight in
    count than sliver and bronze.) The
    barchart gives us more detail helping us
    learn more about the spread of medal
    counts for all countries. It's interesting
    to see that some of the best-performing
    countries won by completely dominating one
    sport whereas some less-competetive
    countries has an average score across all of its best five sports."),
  mainPanel(
    plotlyOutput(
      outputId = "country_chart")
  )
)

page_four <- fluidPage(
  tags$h1("Countries' Medal Percentages"),
  tags$h2("What percentage of competing athletes medaled for each country?"),
  sliderInput("yearSlider", label = h3("Year Range"), min = 1896,
              max = 2016, value = c(1896, 2016), step = 2),
  plotlyOutput(
    outputId = "linegraph"),
  p("This chart intends to represent the skill level of each country over the
    time period given by charting the percentage of athletes that medal from
    each of the top 5 most skilled countries. The top 5 most skilled countries
    are determined by calculating the sum of percentages throughout the time
    period given. While this may not be quite as accurate as a mean of
    percentages, using a sum to get the top 5 most skilled countries ensures
    there is enough data to look at over the given time period. It is important
    to note that the Summer Olympics began
    in 1896, whereas the Winter ones only
    began in 1924. From this data, we can see that Canada, Germany, Norway,
    Russia, and the USA are the top 5 most skilled countries for all of Olympic
    history. We can also see staggeringly high percentages for the first couple
    of Olympic years. This is most likely due to a smaller volume of athletes,
    hence a larger win percentage. When looking at all of the Summer Olympics
    throughout history, USA seems to be the most consistent and has had the
    largest percentage of athletes medal in recent years. When looking at all
    of the Winter Olympics throughout history,
    several of the top countries follow
    similar trends, with Canada taking the lead in recent years, and Russia,
    Norway, and the USA all competing for second.")
)

page_five <- fluidPage(
  tags$h1(id = "summary_title", "Summary and Takeways"),
  tags$p("Through these analyses, we have examined quite a few trends in the
         storied history of the Olympics,
         both about the countries and their competing
         athletes. Here are a few major takeaways:"),
  HTML('<li> As expected, each event has its
  own <i>"zone"</i> of common heights.
  Some sports where
        size is more important, such as <b>Basketball</b>, have
        a higher distribution of heights, while others
        where a smaller size is more beneficial,
        such as <b>Figure Skating</b>, have lower
        height distributions. Additionally,
       an event like <b>Tug-Of-War</b> where strength
       is more important than size, a wider
       distribution of heights is seen</li>'),
  HTML("<li>We learned that by our metrics of success
  (highest medal counts), many countries had
       very different ways to achieve this success.
       Some succeeded sports by racking up gold medal
       after gold medal, while others were more consistent
       and equally placed in gold, silver, and bronze medals. </li>"),
  HTML("<li>Finally, we saw how the five most successful
  countries rose and fell in runs of dominance,
       and besides the impressive run of <b>Canada</b> early
       in the Winter Olympics, the modern Olympics have a
       healthy amount of competition in terms of placing medals,
       at least among its winningest countries. </li>"),
  tags$br(),
  tags$p("Overall, through data organization and analysis,
  we learned that the Olympics are a great display of
         all forms of athleticism with differing approaches
         to success, and that they are in a healthy and competitive
         state in its modern form. Our group was very grateful
         to have had the opportunity of researching a
         topic of shared interest such as the Olympics,
         and werevery satisfied with the results of our project.")


)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(title =
  "Olympic Athlete Data",
  tabPanel("Overview", page_one),
  tabPanel("Heights of Athletes", page_two),
  tabPanel("Countries Specialization", page_three),
  tabPanel("Country Win Percentage", page_four),
  tabPanel("Summary", page_five)
  ))
