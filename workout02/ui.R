#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Investing Modalities"),
  
  # New Row of Slider Inputs
  fluidRow(
    column(4,
      sliderInput("init",
                  "Initial Amount",
                  min = 0,
                  max = 100000,
                  value = 1000,
                  step = 500)
      
    ), 
    
    column(4,
      sliderInput("rate",
                  "Return Rate (in %)",
                  min = 0,
                  max = 20,
                  value = 5,
                  step = 0.1)
      
    ), 
    
    column(4,
      sliderInput("year",
                  "Years",
                  min = 0,
                  max = 50,
                  value = 20,
                  step = 1)
      
    )
    
    
    
  ),
  
  fluidRow(
    column(4,
           sliderInput("contrib",
                       "Annual Contribution",
                       min = 0,
                       max = 50000,
                       value = 2000,
                       step = 500)
           
    ), 
    
    column(4,
           sliderInput("growth",
                       "Growth Rate (in %)",
                       min = 0,
                       max = 20,
                       value = 2,
                       step = 0.1)
           
    ), 
    
    column(4,
           selectInput("facet",
                       "Facet?",
                       c("No", "Yes"))
           
    )
    
    
    
  ),
  
  
  
  # Show a plot of the generated distribution
  mainPanel(
    h4("Timelines"),
    plotOutput("modalitiesPlot"),
    
    h4("Balances"),
    tableOutput("balances")
  )
  
))
    


