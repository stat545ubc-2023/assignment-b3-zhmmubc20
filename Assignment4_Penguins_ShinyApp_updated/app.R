library(shiny)
library(shinythemes)
library(palmerpenguins)
library(datateachr)
library(tidyverse)
library(DT)
library(plotly)

palmerpenguins::penguins_raw


# Define UI for the app
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "cerulean", primary = "#4682B4", secondary = "#4682B480"),
  titlePanel("Penguins Data Review"),
  h1("Penguins Data Set"),
  h3("Visual Presentation of the Penguins Raw Data Set"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("columns", "Select Columns", choices = colnames(palmerpenguins::penguins_raw)),
      downloadButton("DownloadData", "Download Selected Data")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Table", DT::dataTableOutput("table")),
        tabPanel("Average Weight on Islands", 
                 sliderInput("weight_slider", "Select Average Weight Range",
                             min = 2700, max = 6300, value = c(2700, 6300)),
                 plotOutput("avg_weight_plot")
        )
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  output$table <- DT::renderDataTable({
    req(input$columns)
    selected_cols <- input$columns
    
    if (length(selected_cols) > 0) {
      DT::datatable(palmerpenguins::penguins_raw[, selected_cols, drop = FALSE])
    } else {
      DT::datatable(palmerpenguins::penguins_raw)
    }
  })
  
  output$avg_weight_plot <- renderPlot({
    filtered_penguins <- palmerpenguins::penguins_raw %>%
      filter(`Body Mass (g)` >= input$weight_slider[1],
             `Body Mass (g)` <= input$weight_slider[2])
    
    avg_weight <- filtered_penguins %>%
      group_by(Island) %>%
      summarise(avg_weight = mean(`Body Mass (g)`))
    
    ggplot(avg_weight, aes(x = Island, y = avg_weight)) +
      geom_bar(stat = "identity", fill = "#4682B480") +
      labs(x = "Island", y = "Average Weight",
           title = "Average Weight of Selected Penguins on Different Islands")
  })
  
  output$DownloadData <- downloadHandler(
    filename = function() {
      "selected_data.csv"
    },
    content = function(file) {
      req(input$columns)
      selected_cols <- input$columns
      
      if (length(selected_cols) > 0) {
        write.csv(palmerpenguins::penguins_raw[, selected_cols, drop = FALSE], file, row.names = FALSE)
      } else {
        write.csv(palmerpenguins::penguins_raw, file, row.names = FALSE)
      }
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
