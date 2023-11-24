library(shiny)
library(shinythemes)
library(palmerpenguins)
library(datateachr)
library(tidyverse)
library(DT)
library(plotly)

palmerpenguins::penguins_raw

#View(penguins_raw)

#define UI for app

ui <- fluidPage(
  theme = shinytheme("cerulean"), 
  # Application title
  titlePanel("Assignment_b3_Penguins_ShinyApp"),
  #Page title
  h1("Penguins Data Set"),
  #subtitle
  h3("Visual Presentation of the Penguins Raw Data Set"),
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      sliderInput("Body_mass", #Feature 1: Adding an input slider that allows people to select the range of body mass they are curious about.
                  "Body_mass Range:", #title of slider
                  min = 2700, #minimum value
                  max = 6300, #maximum value
                  value = c(2700,6300)), #beginning set shows all data 
      downloadButton("Download", "Download Selected Data")), #Feature 2: Adding a download button allows people to download data they are interested
    
    #main panel with plot on one tab and interactive data table on another
    mainPanel(
      tabsetPanel( #adding tabs
        tabPanel("Body_mass vs. Island Plot", plotOutput("Body_mass_Island_plot")), 
        tabPanel("Table", DT::dataTableOutput("table")) 
      )
    )
  ))

#define server
server <- function(input, output) {
  # Filter penguins data based on body mass range
  filtered_penguins <- reactive({
    palmerpenguins::penguins_raw %>%
      filter(`Body Mass (g)` >= input$Body_mass[1],
             `Body Mass (g)` <= input$Body_mass[2])
  })
  
  # Create plot based on filtered data
  output$Body_mass_Island_plot <- renderPlot({
    ggplot(filtered_penguins(), aes(`Body Mass (g)`, Island)) +
      geom_point() +
      labs(x = "Body Mass (g)", y = "Island") +
      ggtitle("Body Mass vs. Island")
  })
  
  # Render data table based on filtered data
  output$table <- DT::renderDataTable({
    DT::datatable(filtered_penguins())
  })
  
  # Feature 3: Creating an interactive table for download
  output$Download <- downloadHandler(
    filename = function() {
      paste0("selected_data.csv")
    },
    content = function(file) {
      write.csv(filtered_penguins(), file)
    }
  )
}



# Run the application 
shinyApp(ui = ui, server = server)