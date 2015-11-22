
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("What's your cat like?"),
  
  selectInput("gender", "Gender:", 
              choices = c("Male", "Female")),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("c",
                "Cat weight (kg):",
                min = 1,
                max = 20,
                value = 5,
                step = 0.1)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
