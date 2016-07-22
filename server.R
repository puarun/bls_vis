library(shiny)
source('plotmap.R')
source('prep_df.R')
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    tp = input$bins
    df1<-df[df$Year==tp,]
    plotmap(df[df$Year==tp,])
    
  })
})