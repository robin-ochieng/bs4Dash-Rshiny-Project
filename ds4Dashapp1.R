library(shiny)
library(bs4Dash)

shiny::shinyApp(
  ui = bs4DashPage(
      header = bs4DashNavbar(
      skin = "dark",
      status = "white",
      border = FALSE,
      sidebarIcon = shiny::icon("bars"),
      controlbarIcon = shiny::icon("table-cells"),
      fixed = TRUE
    ),
    sidebar = bs4DashSidebar(),
    controlbar = bs4DashControlbar(),
    footer = bs4DashFooter(),
    body = bs4DashBody(
      bs4Card(
        title = "Closable Box with dropdown",
        closable = TRUE,
        width = 12,
        status = "warning",
        solidHeader = FALSE,
        collapsible = TRUE,
        label = 1,
        labelStatus = "danger",
        labelTooltip = "Hi Bro!",
        dropdownIcon = "wrench",
        maximizable = TRUE,
        p("Box Content")
      )
    )
  ),
  server = function(input, output) {
    
  }
)
