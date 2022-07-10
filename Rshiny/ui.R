library(shiny)

# アプリケーションの UI 定義。ヒストグラムを描く
shinyUI(fluidPage(

  # アプリケーションタイトル
  titlePanel("Prediction App"),

  # サイドバー。階級数(bin)のためのスライダー
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        column(12,
          h3("Input"),
          numericInput("plt", 
            label = h4("PLT [X10^4/μL]"), 
            value = 20
          ),
          numericInput("pt", 
            label = h4("PT-INR"), 
            value = 1
          ),
          numericInput("fib", 
            label = h4("Fib [mg/dL]"), 
            value = 300
          ),
          numericInput("fdp", 
            label = h4("FDP [μg/mL]"), 
            value = 2.0
          ),
          numericInput("ddimer", 
            label = h4("D-Dimer [μg/mL]"), 
            value = 0.5
          ),

          submitButton("Submit")),


      )
    ),

    # 生成された分布のプロットを表示する
    mainPanel(
      # plotOutput("distPlot"),
      textOutput("text1")
 
    )
  )
))
