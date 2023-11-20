
library(shiny)
library(e1071)

# Load .rds file for model
loaded_model <- readRDS("Predicting Inflation/Model/svr_model_radial.rds")

# function for predict new data
predict_using_model <- function(lag_2, lag_3) {
  new_data <- data.frame(lag_2 = lag_2, lag_3 = lag_3)
  # do prediction
  prediction <- predict(loaded_model, new_data)
  return(prediction)
}

# UI Shiny
ui <- fluidPage(
  titlePanel("Inflation Predictor"),
  sidebarLayout(
    sidebarPanel(
      numericInput("lag_2", "Enter inflation 2 months ago:", value = NULL),
      numericInput("lag_3", "Enter inflation 3 months ago:", value = NULL),
      actionButton("predict_button", "PREDICT")
    ),
    mainPanel(
      verbatimTextOutput("prediction_output"), width = 4
    )
  )
)

# Server Shiny
server <- function(input, output) {
  observeEvent(input$predict_button, {
    # take value from user input
    lag_2_value <- input$lag_2
    lag_3_value <- input$lag_3
    
    # do prediction using model
    prediction_result <- predict_using_model(lag_2_value, lag_3_value)
    
    # display output prediction
    output$prediction_output <- renderText({
      paste("Inflation Prediction:", prediction_result)
    })
  })
}

# run shiny app
shinyApp(ui = ui, server = server)
