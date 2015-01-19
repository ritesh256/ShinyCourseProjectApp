library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Data Science Specilization Rating"),
  br(),

  sidebarLayout(
    sidebarPanel(
      textInput("fname", "First Name:", "Enter your first name"),
      textInput("lname", "Last Name:", "Enter your Last name"),
      
      selectInput("rating", "Enter Course Rating (1-5, 5 being the best):", 
                  choices = 5:1),
      textInput("feedback", "Provide your feedback:", "Please provide your feedback"),
      actionButton("go", "Submit")
    ),
    
    
    # Show the caption, a summary of the dataset and an HTML 
    # table with the requested number of observations
    mainPanel(
      h4(textOutput("heading", container = span)),
      br(),
      verbatimTextOutput("response"),
      
      br(),
      tags$p("Your Rating for Course:"),
      verbatimTextOutput("rating"),
      tags$p("Your feebback about Course:"),
      verbatimTextOutput("feedback"),
      tags$p("Average Rating of the Course:"),
      verbatimTextOutput("avgrate"),
      tags$p("Based on # of ratings"),
      verbatimTextOutput("numrate"),
      tags$p("Histogram for Rating:"),
      plotOutput('plot')  
    )
  )
))