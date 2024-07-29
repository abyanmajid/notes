library(shiny)
library(tidyverse)
library(palmerpenguins)

numeric_choices = c("body_mass_g", "flipper_length_mm", "bill_depth_mm", "bill_length_mm")

categorical_choices = c("species", "island", "sex", "year")

penguins = penguins |>
    mutate(
        year = factor(year)
    )

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Penguins"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "var_xaxis",
                       label = "X axis variable",
                       choices = numeric_choices,
                       selected = "flipper_length_mm"),
            selectInput(inputId = "var_yaxis",
                       label = "Y axis variable",
                       choices = numeric_choices,
                       selected = "body_mass_g"),
            selectInput(inputId = "var_col",
                       label = "Colouring variable",
                       choices = categorical_choices,
                       selected = "species"),
            selectInput(inputId = "var_facet",
                       label = "Facet variable",
                       choices = categorical_choices,
                       selected = "island"),
           
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        
         penguins |> ggplot() +
            aes(x = .data[[input$var_xaxis]],
                y = .data[[input$var_yaxis]],
                colour = .data[[input$var_col]]) +
            geom_point() +
            facet_grid(cols = vars(.data[[input$var_facet]]))
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
