install.packages("shiny")
install.packages("shinydashboard")

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "My dashboard"),
  dashboardSidebar(), 
  dashboardBody(
    box(plotOutput("correlation_plot"), width = 8)
  )
)


server <- function(input, output){
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length, iris$Petal.Length)
  })
  
}

shinyApp(ui, server)

