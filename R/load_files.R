load_dataUI <- function(id) {
  ns <- NS(id)
  
  tagList(
    # tabBox(width=12,
    fileInput( ns("file"), "Upload Info",multiple = FALSE, accept = ".xlsx"),
    DT::dataTableOutput(ns("contents"))
  )
}


load_data_server <- function(id) {
  
  moduleServer(
    
    id=id,
    module = function(input,output,session) {
      
      output$contents <- renderDT({
        
        inFile <- input$file
        
        if(is.null(inFile))
          return(NULL)
        file.rename(inFile$datapath,
                    paste(inFile$datapath, ".xlsx", sep=""))
        DT <- read_excel(paste(inFile$datapath, ".xlsx", sep=""), 1)
        
        datatable( head(DT), escape = FALSE, selection = 'single',
                   options = list( language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Polish.json'), 
                                   pageLength = 5,lengthMenu = c(5, 10, 15, 20), scrollX = TRUE), filter = 'top')
      })
    }
  )}