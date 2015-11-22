
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(MASS)

shinyServer(function(input, output) {
  
  model <- glm(Hwt ~ Sex + Bwt, data = cats)
  
  prediction <- reactive({
    gender <- substr(input$gender, 0, 1)
    newdata <- data.frame(gender, input$weight)
    names(newdata) <- c("Sex", "Bwt")
    predict(model, newdata)
  })
  
  output$outputString <- renderText(paste("Your cat's heart weighs around ", round(prediction(), digits = 2), "grams."))
  output$code <- renderPrint("model <- glm(Hwt ~ Sex + Bwt, data = cats)")
})
