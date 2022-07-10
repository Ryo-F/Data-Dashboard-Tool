library(shiny)

# アプリケーションの UI 定義。ヒストグラムを描く
shinyUI(fluidPage(

  # アプリケーションタイトル
  titlePanel("Hello Shiny!"),

  # サイドバー。階級数(bin)のためのスライダー
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),

    # 生成された分布のプロットを表示する
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
