shinyUI(fluidPage(
  titlePanel(
    h1("2010 Census Visualization")
  ), 
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps:"), 
      selectInput("select", label = h4("Choose a variable to display"), 
                  choices = list("Percent White", "Percent Black",
                                 "Percent Hispanic", "Percent Asian"), 
                  selected = "Percent White"), 
      sliderInput("slider", label = h4("Range of interest:"), 
                  min = 0, max = 100, value = c(0,100))
    ),
    mainPanel(
      textOutput("text1"), 
      br(),
      textOutput("text2"), 
      br(), 
      plotOutput("map"),
      br(),
      p("This app was created and adapted using lesson 5 in", 
        img(src = "bigorb.png", height = 40, width = 40),
        span("RStudio's", style = "color:blue"), "Shiny tutorial")
    )
  )
))
