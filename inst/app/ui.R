library(shiny)
library(shinydashboard)
library(shinythemes)
library(visNetwork)

ui <- dashboardPage(
  skin = "red",
  title = "netR",

  ## Header
  dashboardHeader(
    # title = span("netR"),
    title = span(img(src = "Capture4.PNG", height = 35),
                 span('NetKnit', style="color:black;font-size:20px;font-family:Cursive"),
                 span("R",style="color:purple;font-size:25px;font-family:Cursive;margin-left:-5px")),
    titleWidth = 300,

    tags$li(
      a(
        strong("About NetKnitR"),
        height = 40,
        href = "https://github.com/",
        title = "",
        target = "_blank"
      ),
      class = "dropdown"
    )

  ),
  dashboardSidebar(
    fileInput("input_file", "Choose CSV File",
              accept = c(
                ".xlsx",
                ".csv")
    ),
    uiOutput("column_inputs"),
    uiOutput('data_process_type'),
    actionButton('go','Create network')
  ),
  dashboardBody(
    fluidPage(
      # visNetworkOutput("map", width = '975px', height = '550px'),
      tabBox(
        id = "tabset", width = 12, title = span('Click on "Create Network" to update network, randomise shapes & colors.', style="color:blue;font-size:10px;font-family:Cursive"),
        tabPanel("Network",uiOutput('detailed_network_output')),
        tabPanel("Nodes", DT::dataTableOutput("nodes")),
        tabPanel("Edges", DT::dataTableOutput("edges"))
      )
      # tabBox(
      #   id = "tabset1", height = "150px",
      #   tabPanel("Nodes", DT::dataTableOutput("nodes"))
      # ),
      # tabBox(
      #   id = "tabset2", height = "150px",
      #   tabPanel("Edges", DT::dataTableOutput("edges"))
      # )
    )
  )

)
