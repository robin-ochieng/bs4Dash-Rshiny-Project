library(shiny)
library(bs4Dash)

ui <- dashboardPage(
  header = dashboardHeader(),
  sidebar = dashboardSidebar(),
  body = dashboardBody(
    actionButton(inputId = "controlbarToggle", label = "Toggle Controlbar")
  ),
  controlbar = dashboardControlbar(inputId = "controlbar")
)

server <- function(input, output, session) {
  observeEvent(input$controlbar, {
    if (input$controlbar) {
      showModal(modalDialog(
        title = "Alert",
        "The controlbar is opened.",
        easyClose = TRUE,
        footer = NULL
      ))
    }
  })
  
  observeEvent(input$controlbarToggle, {
    updatebs4Controlbar(inputId = "controlbar", session = session)
  })
  
  observe({
    print(input$controlbar)
  })
}

shinyApp(ui, server)
