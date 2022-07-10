library(shiny)
library(caret)
library(xgboost)

xgb_model <- readRDS("xbg_R")

shinyServer(function(input, output) {
  output$text1 <- renderText({ 
      input_df_raw <- data.frame(c(input$plt, input$pt, input$fdp, input$fib, input$ddimer))

      # numeric
      input_df <- as.numeric(input_df_raw[,])

      # log
      input_df_log <- log(input_df)
      input_df_transposed <- data.frame(t(input_df_log))
      colnames(input_df_transposed) <- c('plt', 'pt', 'fdp', 'fib', 'ddimer')
      pred_xgb <- predict(xgb_model, input_df_transposed)
      paste("The prediction is ", pred_xgb)
  })
})