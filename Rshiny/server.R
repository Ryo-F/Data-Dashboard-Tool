library(caret)
library(xgboost)

library(shiny)

xgb_model <- readRDS("xbg_R")

# サーバロジックの定義。ヒストグラムを描く
shinyServer(function(input, output) {


  output$text1 <- renderText({ 
      input_df_raw <- data.frame(c(input$plt, input$pt, input$fdp, input$fib, input$ddimer))

      # numeric
      input_df <- as.numeric(input_df_raw[,])
      input_df[-1] <- input_df[-1] + 1

      # log
      input_df_log <- log(input_df)
      input_df_transposed <- data.frame(t(input_df_log))
      colnames(input_df_transposed) <- c('plt', 'pt', 'fdp', 'fib', 'ddimer')
      pred_xgb <- predict(xgb_model, input_df_transposed)
      paste("The prediction is ", pred_xgb)
  })
})