library(shiny)
library(shinydashboard)
library(readxl)
library(DT)





ui <- fluidPage(
  dashboardPage(
    dashboardHeader(title = "Analyzer Tool" , titleWidth = 200, disable = FALSE),
    dashboardSidebar(width=200,
                     br(),
                     sidebarMenu(
                     )
    ),
    
    dashboardBody(tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css.css")),
                  
                  
                  # fluidRow(
                  #   column(2,
                  #          
                  #          box(title = "Wybor filtrow",status = "primary" ,solidHeader = T,width = NULL,collapsible=FALSE)),
                  #              #selectizeInput(inputId ="Linia","Stacja:", c(unique(as.character(Master_data$Line))),
                  # 
                  #    column(10,
                  #           box( title = "Sorce data",status = "primary",solidHeader = T,width = NULL,collapsible=TRUE,
                  #                tabBox(width=12,title="Source Data",id="sd",
                  #                tabPanel( "Patient data",
                  #                          load_dataUI("main1")),
                  #                 tabPanel("Lab Info data",
                  #                          load_dataUI("main2"))
                  #           ))
                  
                  
                  fluidRow(
                    tabBox(width=12,title="Source Data",id="sd",
                           
                           tabPanel( "Patient data",
                                     load_dataUI("main1")),
                           tabPanel("Lab Info data",
                                    load_dataUI("main2"))
                           
                    ) 
                    
                    
                  ))
  ))

# ui <- fluidPage(
#   column(6, load_dataUI("main1")),
#   column(6, load_dataUI("main2"))
# )

server <- function(input, output, session) {
  
  
  load_data_server("main1")
  load_data_server("main2")
}

shinyApp(ui, server)