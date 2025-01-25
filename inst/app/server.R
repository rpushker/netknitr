server <- function(input, output) {

  input_data <- reactive({
    inFile <- input$input_file
    if (is.null(inFile)) {
      mtcars$name <- row.names(mtcars)
      return(mtcars)
    } else {
      return(readMyFile(inFile$datapath))
    }
  })

  nodes <- eventReactive(input$go, {
    cols <- input$cols_for_net
    my_data <- input_data()
    if(input$data_process_type == "Unique items as nodes") {
      my_data <- fixNodeBias(my_data)
    }
    nodes <- getNodes(my_data,
                      columns_for_nodes = cols,
                      group = TRUE)
    nodes$shape <- getShapes(nodes)
    nodes$colors <- sample(c("darkred",
                             "grey",
                             "orange",
                             "darkblue",
                             "purple",
                             'green'),
                           nrow(nodes),
                           replace = T)
    nodes
  })

  associations <- eventReactive(input$go, {
    cols <- input$cols_for_net
    my_data <- input_data()
    if(input$data_process_type == "Unique items as nodes") {
      my_data <- fixNodeBias(my_data)
    }
    associations <- getAssociation(my_data[,cols])
  })

  edges <- eventReactive(input$go,{
    cols <- input$cols_for_net
    my_data <- input_data()
    if(input$data_process_type == "Unique items as nodes") {
      my_data <- fixNodeBias(my_data)
    }
    associations <- getAssociation(my_data[,cols])
    getEdges(associations,nodes())
  })

  output$column_inputs <- renderUI({
    tmp <- input_data()
    col_names <- names(tmp)
    selectInput(inputId = "cols_for_net",
                label = "Select atleast 3 columns",
                choices = col_names,
                selected = col_names[1:3],
                multiple = TRUE)
  })

  output$data_process_type <- renderUI({
    radioButtons(inputId = 'data_process_type',
                 label = "Consider",
                 choices = c('Unique items as nodes',
                             "As it is"), "As it is")
  })

  output$nodes <- DT::renderDataTable({
    x <- nodes()
    DT::datatable(x, class = 'cell-border stripe',
                  selection=list(mode="multiple", target="row"),
                  rownames=TRUE,
                  options = list(scrollX = TRUE,
                                 autoWidth = FALSE))
  })

  output$edges <- DT::renderDataTable({
    x <- associations()
    DT::datatable(x, class = 'cell-border stripe',
                  selection=list(mode="multiple", target="row"),
                  rownames=TRUE,
                  options = list(scrollX = TRUE,
                                 autoWidth = FALSE))
  })

  output$map <- renderVisNetwork({
    visNetwork::visNetwork(nodes(), edges())
  })

  output$detailed_network_output <- renderUI({
    if(input$go == 0) {
      h4("Please choose your options and click on Create Network!")
    } else {
      visNetwork::visNetworkOutput("map", width = '975px', height = '550px')
    }
  })

}
