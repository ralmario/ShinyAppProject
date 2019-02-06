# Load libraries needed
library(shiny)

# Initialize select input options
formulas <- c("Production volume (MT)" = "ProdVolume", "Area harvested (Ha)" = "AreaHA", 
              "Yield per Hectare (Kg)" = "Yield", "Gross returns per Hectare (PhP/Ha)" = "Gross")

# Define UI for app that plots bar graphs
shinyUI(fluidPage(
        # App title and data citation
        titlePanel("Philippines Major Rice Data by Year (2001-2017)"),
        h3("Source: Philippine Statistics Authority (PSA)"),
        # Sidebar with a select input for category selection
        sidebarLayout(
                sidebarPanel(
                        selectInput("compute",
                                    "Select category:",
                                    selected = formulas[1],
                                    formulas
                        ),
                        width = 4
                ),
                mainPanel(
                        # Show graph of the selected category
                        plotOutput("ricePlot"),
                        h3("Philippine average from 2001-2017:"),
                        # Show average of the selected category from 2001-2017
                        textOutput("riceAvg")
                )
        )
))