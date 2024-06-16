library(shiny)
library(bs4Dash)

# Define UI
ui <- bs4DashPage(
  title = "DashboardPage",
  header = bs4DashNavbar(),  # This is where the navbar should be
  sidebar = bs4DashSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      actionButton(inputId = "triggerCard", label = "Trigger Card Action"),
      selectInput(
        inputId = "cardAction",
        label = "Card action",
        choices = c("remove", "toggle", "toggleMaximize", "restore")
      )
    )
  ),
  body = bs4DashBody(
    bs4TabItems(
      bs4TabItem(
        tabName = "dashboard",
        bs4Card(
          inputId = "mycard",
          title = "The plot is visible when you maximize the card",
          closable = TRUE,
          maximizable = TRUE,
          width = 12,
          status = "warning",
          solidHeader = FALSE,
          collapsible = TRUE,
          sliderInput("obs", "Number of observations:", min = 0, max = 1000, value = 500),
          plotOutput("distPlot")
        )
      )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  output$distPlot <- renderPlot({
    if (input$mycardMaximized) {
      hist(rnorm(input$obs))
    }
  })
  
  observeEvent(input$triggerCard, {
    updatebs4Card(
      inputId = "mycard",
      session = session,
      action = input$cardAction
    )
  })
  
  observe({
    print(
      list(
        collapsed = input$mycardCollapsed,
        maximized = input$mycardMaximized,
        visible = input$mycardVisible
      )
    )
  })
}

# Run the application
shinyApp(ui, server)
