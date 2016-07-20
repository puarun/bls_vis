library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")

shinyServer(function(input,output){
  output$text1 <- renderText({
    paste("You have selected", input$select, sep = " ")
  })
  output$text2 <- renderText({
    paste(paste(paste("You have chosen a range that goes from ", input$slider[1]), 
                " to "), input$slider[2]) 
  })
  output$map <- renderPlot({
    data <- switch(input$select, 
                   "Percent White" = counties$white, 
                   "Percent Black" = counties$black, 
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    color <- switch(input$select, 
                    "Percent White" = "darkgreen", 
                    "Percent Black" = "darkviolet", 
                    "Percent Hispanic" = "darkblue",
                    "Percent Asian" = "darkorange")
    label <- switch(input$select, 
                    "Percent White" = "% White", 
                    "Percent Black" = "% Black", 
                    "Percent Hispanic" = "% Hispanic",
                    "Percent Asian" = "% Asian")
    
    percent_map(var = data, 
                color = color , 
                legend.title = label, 
                max = input$slider[2], 
                min = input$slider[1])
  })
})