library(shiny)
library(bs4Dash)



shiny::shinyApp(
  ui = bs4DashPage(
    tags$head(
      tags$style(HTML("
                body {
                    font-family: 'Mulish', sans-serif;
                }
            "))
    ),
    header = bs4DashNavbar(
      skin = "dark",
      status = "white",
      border = FALSE,
      sidebarIcon = shiny::icon("bars"),
      controlbarIcon = shiny::icon("table-cells"),
      fixed = FALSE
    ),
    sidebar = bs4DashSidebar(
      disable = FALSE,
      width = NULL,
      skin = "white",
      status = "primary",
      elevation = 4,
      collapsed = FALSE,
      minified = TRUE,
      expandOnHover = TRUE,
      fixed = TRUE,
      id = "sidebar",
      customArea = NULL,
  
      tags$ul(
        tags$li(class = "header header-icon", 
                tags$i(class = "fas fa-chart-pie", style="margin-right: 10px;"),  # Example icon
                "Dashboard Title"
        )
      ),
      bs4SidebarMenu(
        id = "sidebarmenu",
        .list = NULL,
        flat = TRUE,
        compact = TRUE,
        childIndent = TRUE,
        legacy = FALSE,
        bs4SidebarHeader("Main Navigation"),
        bs4SidebarMenuItem(
          "Tab 1",
          tabName = "Tab1",
          icon = NULL,
          startExpanded = FALSE
        ),
        bs4SidebarMenuItem(
          "Tab 2",
          tabName = "Tab2",
          icon = NULL,
          startExpanded = FALSE
        ),
        bs4SidebarMenuItem(
          "Tab 3",
          tabName = "Tab3",
          icon = icon("table-cells"),
          startExpanded = FALSE,
          bs4SidebarMenuSubItem(
            text = "Tab 4",
            tabName = "Tab4",
            icon = icon("circle")
            
          ),
          bs4SidebarMenuSubItem(
            text = "Tab 5",
            tabName = "Tab5",
            icon = icon("circle")
            
          )
        )
      )
    ),
    controlbar = bs4DashControlbar(
      id = "controlbar",
      disable = FALSE,
      width = 250,
      collapsed = TRUE,
      overlay = TRUE,
      skin = "light",
      pinned = NULL,
      
      controlbarMenu(
        id = "tabcard",  
        vertical = TRUE,
        type = "pills",
        side = "left",
        controlbarItem(
          tabName = "Tab 1",   
          active = FALSE,      
          "Content 1",
          icon = NULL
        ),
        controlbarItem(
          tabName = "Tab 2",   
          active = TRUE,       
          "Content 2",
          icon = NULL
        ),
        controlbarItem(
          tabName = "Tab 3",   
          active = FALSE,      
          "Content 3", 
          icon = NULL          
        )
      )
      
    ),
    footer = bs4DashFooter(
      left = "@RobinOchieng",
      right = "2024", 
      fixed = FALSE
    ),
    body = bs4DashBody(
      bs4TabItems(
        bs4TabItem( 
          tabName = "Tab1",
      bs4Card(
        title = "mydashboard",
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
    ),
    bs4TabItem(
      tabName = "Tab2", 
      bs4Quote("Blahblah", color = "info"),
      bs4Quote("Blahblah", color = "danger"),
      bs4Quote("Blahblah", color = "secondary"),
      bs4Quote("Blahblah", color = "primary"),
      bs4Quote("Blahblah", color = "warning"),
      bs4Quote("Blahblah", color = "success")
      )
    )
    )  
  ),
  server = function(input, output) {
    observeEvent(input$sidebarmenu, {
      if (input$sidebarmenu == "Tab2"){
        showModal(modalDialog(
          title = "Important message",
          "This is an important message!"
        ))
      }
    })
    observe(print(input$sidebar))
    observe(print(input$sidebarmenu))
    observe(print(input$controlbar))
  }
)
