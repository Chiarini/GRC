####################################
#### Marelli GRC KPI - server.R ###
####################################

library(shiny)
library(plyr)
library(ggplot2)
#library(tidyverse)

#load("analytics.Rdata") # load the dataframe

load("RPT_ID10_IWOG046MSuspP52Marzo2020.Rdata") # load the dataframe

#G046Msusp <- read.csv2("RPT_ID10_IWOG046MSuspP52Marzo2020.csv")
#G048MEurope <- read.csv2("RPT_ID10_IWOG048MEuropeP52Marzo2020.csv")
#G351MALighting <- read.csv2("RPT_ID10_IWOG351MALightingP52Marzo2020.csv")
#save(RPT_ID10_IWOG046MSuspP52Marzo2020, file = "RPT_ID10_IWOG046MSuspP52Marzo2020.RData")
#save(RPT_ID10_IWOG048MEuropeP52Marzo2020, file = "RPT_ID10_IWOG048MEuropeP52Marzo2020.RData")
#save(RPT_ID10_IWOG351MALightingP52Marzo2020, file = "RPT_ID10_IWOG351MALightingP52Marzo2020.RData")

shinyServer(function(input, output) { # server is defined within these parentheses
  
  # prep data once and then pass around the program
  
  passData <- reactive({
    
    analytics <- analytics[analytics$Date %in% seq.Date(input$dateRange[1], input$dateRange[2], by = "days"),]
    
#    analytics <- analytics[analytics$Hour %in% as.numeric(input$minimumTime) : as.numeric(input$maximumTime),]
    
    if(class(input$regionShow)=="character"){
      
      analytics <- analytics[analytics$Domain %in% unlist(input$regionShow),]
      
    }
    
    analytics
    
  })
  
  output$monthGraph <- renderPlot({
    
    graphData <- ddply(passData(), .(Domain, Date), numcolwise(sum))
    
    if(input$outputType == "G351"){
      
      theGraph <- ggplot(graphData, aes(x = Date, y = visitors, group = Domain, colour = Domain)) + geom_line() +
        ylab("Unique visitors")
      
    }
    
    if(input$outputType == "G048"){
      
      theGraph <- ggplot(graphData, aes(x = Date, y = bounces / visits * 100, group = Domain, colour = Domain)) +
        geom_line() + ylab("Bounce rate %")
      
    }
    
    if(input$outputType == "G046"){
      
      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) +
        geom_line() + ylab("Average time on site")
      
    }
    
    if(input$smoother){
      
      theGraph <- theGraph + geom_smooth()
      
    }
    
    print(theGraph)
    
  })
  
  output$hourGraph <- renderPlot({
    
    graphData = ddply(passData(), .(Domain, Hour), numcolwise(sum))
    
    if(input$outputType == "G351"){
      
      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) + geom_line() +
        ylab("Unique visitors")
      
    }
    
    if(input$outputType == "G048"){
      
      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) +
        geom_line() + ylab("Bounce rate %")
      
    }
    
    if(input$outputType == "G046"){
      
      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) +
        geom_line() + ylab("Average time on site")
      
    }
        
    if(input$smoother){
      
      theGraph <- theGraph + geom_smooth()
      
    }
    
    print(theGraph)
    
  })
  
  
  output$textDisplay <- renderText({ 
    
    paste(
      length(seq.Date(input$dateRange[1], input$dateRange[2], by = "days")),
      " days are summarised. There were", sum(passData()$visitors), "visitors in this time period."
    )
    
  })
})