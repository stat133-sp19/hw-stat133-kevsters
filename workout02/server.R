#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

future_value <- function(amount, rate, years) {
  return(amount * ((1 + rate) ^ years))
}

annuity <- function(contrib, rate, years) {
  return(contrib * ((((1 + rate) ^ years) - 1)/(rate)))
}

growing_annuity <- function(contrib, rate, growth, years) {
  return(contrib * ((((1 + rate) ^ years) - ((1 + growth) ^ years))/(rate - growth)))
}

shinyServer(function(input, output) {
  
  #future_value = input$init * ((1 + input$rate) ^ input$year)
  #annuity = input$contrib * ((((1 + input$rate) ^ input$year) - 1)/(input$rate))
  #growing_annuity = input$contrib * ((((1 + input$rate) ^ input$year) - 
                                                  #((1 + input$growth) ^ input$year))/(input$rate - input$growth))
  
  
  output$modalitiesPlot <- renderPlot({
    
    init = input$init
    contrib = input$contrib
    rate = input$rate / 100
    growth = input$growth / 100
    
    year = 0:input$year
    no_contrib = vector()
    fixed_contrib = vector()
    growing_contrib = vector()
    
    for (i in year) {
      no_contrib[i + 1] = future_value(init, rate, i)
      fixed_contrib[i + 1] = future_value(init, rate, i) + annuity(contrib, rate, i)
      growing_contrib[i + 1] = future_value(init, rate, i) + growing_annuity(contrib, rate, growth, i)
    }
    
    modalities = data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    
    if (input$facet == "No") {
      result = ggplot(data = modalities, aes(x = year)) + 
        geom_line(aes(y = no_contrib, colour = "No Annuity")) + 
        geom_line(aes(y = fixed_contrib, colour = "Fixed Annuity")) + 
        geom_line(aes(y = growing_contrib, colour = "Growing Annuity")) + 
        scale_colour_manual("variable", 
                            values = c("No Annuity" = "blue", "Fixed Annuity" = "red", "Growing Annuity" = "green")) + 
        xlab("Year") + 
        ylab("Value") +
        labs(title = "Annual Growth of Various Investment Plans Over Time")
    } else {
      repped_years = rep(year, 3)
      value = c(no_contrib, fixed_contrib, growing_contrib)
      
      variable = factor(c("No Annuity", "Fixed Annuity", "Growing Annuity"), 
                     levels = c("No Annuity", "Fixed Annuity", "Growing Annuity"))
      
      variable = rep(variable, each = (input$year + 1))
      
      #modes = rep(modes, each = input$year + 1)
      
      
      
      faceted_modalities = data.frame(repped_years, value, variable)
      
      result = ggplot(data = faceted_modalities, aes(x = repped_years, color = variable)) + 
        geom_line(aes(y = value)) +
        geom_area(aes(y = value, fill = variable)) +
        xlab("Year") + 
        ylab("Value") +
        labs(title = "Annual Growth of Various Investment Plans Over Time") +
        facet_wrap(variable)
    }
    
    result
    
  })
  
 output$balances <- renderTable({
   init = input$init
   contrib = input$contrib
   rate = input$rate / 100
   growth = input$growth / 100
   
   year = 0:input$year
   no_contrib = vector()
   fixed_contrib = vector()
   growing_contrib = vector()
   
   for (i in year) {
     no_contrib[i + 1] = future_value(init, rate, i)
     fixed_contrib[i + 1] = future_value(init, rate, i) + annuity(contrib, rate, i)
     growing_contrib[i + 1] = future_value(init, rate, i) + growing_annuity(contrib, rate, growth, i)
   }
   
   modalities = data.frame(year, no_contrib, fixed_contrib, growing_contrib)
   
    modalities
  })
  
})
