library(shiny)
library(bs4Dash)

shinyApp(
  ui = dashboardPage(
    header = dashboardHeader(),
    sidebar = dashboardSidebar(),
    controlbar = dashboardControlbar(),
    footer = dashboardFooter(),
    title = "Handle tabs",
    body = dashboardBody(
      actionButton("add", "Add 'Dynamic' tab"),
      actionButton("remove", "Remove 'Foo' tab"),
      actionButton("hideTab", "Hide 'Foo' tab"),
      actionButton("showTab", "Show 'Foo' tab"),
      br(), br(),
      tabBox(
        id = "tabs",
        title = "A card with tabs",
        selected = "Bar",
        status = "primary",
        solidHeader = FALSE, 
        type = "tabs",
        tabPanel("Hello", "This is the hello tab"),
        tabPanel("Foo", "This is the foo tab"),
        tabPanel("Bar", "This is the bar tab")
      )
    )
  ),
  server = function(input, output, session) {
    observeEvent(input$add, {
      insertTab(
        inputId = "tabs",
        tabPanel("Dynamic", "This a dynamically-added tab"),
        target = "Bar",
        select = TRUE
      )
    })
    
    observeEvent(input$remove, {
      removeTab(inputId = "tabs", target = "Foo")
    })
    
    observeEvent(input$hideTab, {
      hideTab(inputId = "tabs", target = "Foo")
    })
    
    observeEvent(input$showTab, {
      showTab(inputId = "tabs", target = "Foo")
    })
  }
)