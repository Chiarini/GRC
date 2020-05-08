###############################
### Marelli GRC KPI - ui.R ###
###############################

library(shiny) 

shinyUI(pageWithSidebar( 
  
  headerPanel("Marelli GRC KPI"), 
  
  sidebarPanel( 
    
    selectInput(inputId = "Year",  
                   label = "Year range", 
                   list('2017','2018','2019','2020'),),
    
#    sliderInput(inputId = "minimumTime",
#                label = "Hours of interest- minimum",
#                min = 0,
#                max = 23,
#                value = 0,
#                step = 1),
#    
#    sliderInput(inputId = "maximumTime",
#                label = "Hours of interest- maximum",
#                min = 0,
#                max = 23,
#                value = 23,
#                step = 1),
#    
#    checkboxInput(inputId = "smoother",
#                  label = "Add smoother?",
#                  value = FALSE),
    
#    checkboxGroupInput(inputId = "regionShow",
#                       label = "EMEA",
#                       choices = list("Marelli A. Lighting Italy S.p.A." = "NHS",
#                                      "Marelli Europe S.p.A." = "bounceRate",
#                                      "Marelli Suspension S. Italy S.p.A." = "Other")
#                       ),
    

radioButtons(inputId = "Company",
             label = "EMEA Companies:",
             choices = list("Marelli Aftermarket Italy S.p.A." = "ZM01",
                            "Marelli A. Lighting Italy S.p.A." = "G351",
                            "Marelli A.L. Reutlingen GmbH" = "D001",
                            "Marelli Bielsko B. Poland Sp.zoo" = "P001",
                            "Marelli Europe S.p.A." = "G048",
                            "Marelli Suspension S. Italy S.p.A." = "G046"))


  ),

  mainPanel(
    tabsetPanel( 
      tabPanel("Summary", textOutput("textDisplay")), 
      tabPanel("Invoices without P.O.", plotOutput("monthGraph")),
      tabPanel("Assets aging", plotOutput("hourGraph"))
    )
  )
))