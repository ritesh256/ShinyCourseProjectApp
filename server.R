library(shiny)



# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {

  v <- reactive({
  write.table(input$rating,file="data/rating.csv",sep=",",append=TRUE,row.names=FALSE,col.names=F)
  rats <- read.csv("data/rating.csv", header=T)
  })
  
  output$heading <- renderText({
    "Application collects user ratings for Data science specilization track and provides
    the avergage rating for Specilization. User need to provides its rating on left hand side
    bar and submit the form"
  })
 
  
  output$response <- renderText({
    if (input$go == 0)
      return()
    paste("Thank you", toupper(input$fname), toupper(input$lname), "for providing your rating and feedback")    

  })
  
  output$rating <- renderText({
    if (input$go == 0)
      return()
    input$rating    
  })
  
  output$feedback <- renderText({
    if (input$go == 0)
      return()
    input$feedback    
  })
  
  output$avgrate <- renderText({
    if (input$go == 0)
      return()
    rats <- v()
    mean(rats$rating)   
  })
  
  output$numrate <- renderText({
    if (input$go == 0)
      return()
    rats <- v()
    nrow(rats)
  })

  output$plot <- renderPlot({
    if (input$go == 0)
      return()
    user <- v()
    hist(user$rating)
  })
})
