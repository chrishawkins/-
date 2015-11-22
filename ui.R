
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("🐱 ❤ ⚖"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    selectInput("gender", "Gender:", 
                choices = c("Male", "Female")),
    
    sliderInput("weight",
                "Weight (kg):",
                min = 1,
                max = 8,
                value = 4,
                step = 0.1)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    p(strong("Select your cat's sex and weight using the controls on the left. The weight
      of your cat's heart will then be predicted using a linear model.")),
    p(textOutput("outputString")),
    hr(),
    p(strong("The code for model generation is provided below:")),
    verbatimTextOutput("code")
  )
))
