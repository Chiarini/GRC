####################################
#### Marelli GRC KPI - server.R ###
####################################

library(shiny)
library(plyr)
library(ggplot2)
#library(tidyverse)

#load("analytics.Rdata") # load the dataframe

(load("RPT_ID10_IWOG046MSuspP52Marzo2020.RData")) # load the dataframe
(load("RPT_ID10_IWOG048MEuropeP52Marzo2020.RData")) # load the dataframe


#G046Msusp <- read.csv2("RPT_ID10_IWOG046MSuspP52Marzo2020.csv")
#G048MEurope <- read.csv2("RPT_ID10_IWOG048MEuropeP52Marzo2020.csv")
#G351MALighting <- read.csv2("RPT_ID10_IWOG351MALightingP52Marzo2020.csv")
#save(RPT_ID10_IWOG046MSuspP52Marzo2020, file = "RPT_ID10_IWOG046MSuspP52Marzo2020.RData")
#save(RPT_ID10_IWOG048MEuropeP52Marzo2020, file = "RPT_ID10_IWOG048MEuropeP52Marzo2020.RData")
#save(RPT_ID10_IWOG351MALightingP52Marzo2020, file = "RPT_ID10_IWOG351MALightingP52Marzo2020.RData")

shinyServer(function(input, output) { # server is defined within these parentheses
  
  # prep data once and then pass around the program
  
  passData <- reactive({
    
#    if(class(input$regionShow)=="character"){
      
#      analytics <- analytics[analytics$Domain %in% unlist(input$regionShow),]
      
#      RPT_ID10_IWOG046MSuspP52Marzo2020 <- RPT_ID10_IWOG046MSuspP52Marzo2020[unlist(input$regionShow),]
      
#    }
    
    RPT_ID10_IWOG046MSuspP52Marzo2020
    
   })
  
  output$monthGraph <- renderPlot({
    
    graphData <- ddply(passData(), .(Anno_Mese, Amount_TOT, c_AmountCluster), numcolwise(sum))
    
#    if(input$outputType == "G351"){
      
      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) + geom_line()
      
#    }
    
#    if(input$outputType == "G048"){
#      
#      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) + geom_line()
      
#    }
    
#    if(input$outputType == "G046"){
      
#      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) + geom_line()
      
#    }
    
#    if(input$smoother){
      
#      theGraph <- theGraph + geom_smooth()
      
#    }
    
    print(theGraph)
    
  })
  
  output$hourGraph <- renderPlot({
    
    graphData = ddply(passData(), .(Anno_Mese, Amount_TOT, c_AmountCluster), numcolwise(sum))
    
#    if(input$outputType == "G351"){
      
      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) + geom_line()
      
#    }
    
#    if(input$outputType == "G048"){
      
#      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) + geom_line()
      
#    }
    
#    if(input$outputType == "G046"){
      
#      theGraph <- ggplot(graphData, aes(x = Anno_Mese, y = Amount_TOT, group = c_AmountCluster, colour = c_AmountCluster)) + geom_line()
      
#    }
        
#    if(input$smoother){
      
#      theGraph <- theGraph + geom_smooth()
      
#    }
    
    print(theGraph)
    
  })
  
  
#  output$textDisplay <- renderText({ 
#    
#    paste(
#      length(seq.Date(input$dateRange[1], input$dateRange[2], by = "days")),
#      " days are summarised. There were", sum(passData()$Amount_TOT), "visitors in this time period"
#    )
#    
#  })
})