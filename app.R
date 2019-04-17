#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Workout 02: Saving and Investing"),
   
   # Sliders in columns
   fluidRow(
     column(4,
       sliderInput("initial_amount",
                   "Initial Amount",
                   min = 1,
                   max = 100000,
                   value = 1000,
                   step = 500),

            sliderInput("annual_contrib",
                        "Annual Contribution",
                        min = 0, 
                        max = 50000, 
                        value = 2000,
                        step = 500)),
     
     column(4,
       sliderInput("return_rate",
                   "Return Rate (in %)",
                   min = 0,
                   max = 20,
                   value = 5,
                   step = 0.1),
     
            sliderInput("growth_rate",
                        "Growth Rate (in %)",
                        min = 0, 
                        max = 20, 
                        value = 2,
                        step = 0.1)),
     column(4, 
       sliderInput("years",
                    "Years",
                    min = 0, 
                    max = 50, 
                    value = 20,
                    step = 1),
     
       selectInput("facet",
                   "Facet?",
                   choices = c("No", "Yes")))
     ),
      
      # Show a plot of the generated distribution
   h3("Timelines"),
   column(12,
     plotOutput("timelinePlot")
   ),
   
   h3("Balances"),
   column(12,
          tableOutput("balancesTable"))
   )


# Define server logic required to draw a histogram
library(ggplot2)
library(scales)
server <- function(input, output) {
   
   output$timelinePlot <- renderPlot({
     
     no_contrib = vector("numeric", (input$years + 1))
     for (k in 0:input$years) {
       future_value_nc = input$initial_amount * ((1 + (input$return_rate / 100)) ^ k)
       no_contrib[k + 1] = future_value_nc
     }
     
     fixed_contrib = vector("numeric", (input$years + 1))
     for (k in 0:input$years) {
       future_value_fc = input$initial_amount * ((1 + (input$return_rate / 100)) ^ k)
       annuity_fc = input$annual_contrib * (((1 + (input$return_rate / 100)) ^ k - 1)/(input$return_rate / 100))
       fixed_contrib[k + 1] = future_value_fc + annuity_fc
     }
     
     growing_contrib = vector("numeric", (input$years + 1))
     for (k in 0:input$years) {
       future_value_gc = input$initial_amount * ((1 + (input$return_rate / 100)) ^ k)
       growing_annuity_gc = input$annual_contrib * (((1 + (input$return_rate / 100)) ^ k) - (1 + (input$growth_rate / 100)) ^ k)/((input$return_rate / 100) - (input$growth_rate  / 100))
       growing_contrib[k + 1] = future_value_gc + growing_annuity_gc
     }
     
     modalities = data.frame(c(0:input$years), no_contrib, fixed_contrib, growing_contrib)
     names(modalities) = c("year", "no_contrib", "fixed_contrib", "growing_contrib")
     
     library(reshape2)
     faceted_data = melt(modalities, id = c("year"))
     
  # draw the plot 
  #if facet is yes
  if (input$facet == "Yes"){
     print(ggplot(faceted_data, aes(x = year, y = value, color = variable)) +
      geom_area(aes(fill = variable), alpha = 0.6) +
      geom_point() +
      scale_y_continuous(labels = comma) +
      ylab("value") +
      labs(fill = "variable") +
      ggtitle("Three modes of investing") +
      facet_grid(.~ variable) 
        )
    
  }
  #if facet is no
  else {
    print(ggplot(faceted_data, aes(x = year, y = value, color = variable)) +
            geom_line() +
            geom_point() +
            scale_y_continuous(labels = comma) +
            ylab("value") +
            labs(fill = "variable") +
            ggtitle("Three modes of investing") 
    )
  }
  
     #draw the table
     output$balancesTable = renderTable({
       head(modalities, 11)})
   })
   
   
   }
   

# Run the application 
shinyApp(ui = ui, server = server)

