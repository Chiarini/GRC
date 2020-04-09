###############################
### Marelli GRC KPI - ui.R ###
###############################

library(shiny) 

shinyUI(pageWithSidebar( 
  
  headerPanel("Marelli GRC KPI"), 
  
  sidebarPanel( 
    
    dateRangeInput(inputId = "dateRange",  
                   label = "Date range", 
                   start = "2017-01-01",
                   max = Sys.Date()
    ),
    
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
    
    checkboxGroupInput(inputId = "regionShow",
                       label = "EMEA",
                       choices = list("Marelli A. Lighting Italy S.p.A." = "NHS",
                                      "Marelli Europe S.p.A." = "bounceRate",
                                      "Marelli Suspension S. Italy S.p.A." = "Other")
                       ),
    
#    radioButtons(inputId = "outputType",
#                 label = "Output required",
#                 choices = list("Marelli Automotive Lighting Italy S.p.A." = "visitors",
#                                "Marelli Europe S.p.A." = "bounceRate",
#                                "Marelli Suspension Systems Italy S.p.A." = "timeOnSite"))

  ),

  mainPanel(
    tabsetPanel( 
      tabPanel("Summary", textOutput("textDisplay")), 
      tabPanel("Invoices without P.O.", plotOutput("monthGraph")),
      tabPanel("Assets aging", plotOutput("hourGraph"))
    )
  )
))