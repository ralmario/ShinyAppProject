# Load libraries needed
library(shiny)
library(openxlsx)
library(ggplot2)

# Load rice data
riceData <- read.xlsx("riceData.xlsx", sheet=1, colNames=TRUE, 
                      skipEmptyRows = FALSE, skipEmptyCols = TRUE, 
                      fillMergedCells = FALSE, startRow = 1)

# Define server logic required to draw the plot and display the average
shinyServer(function(input, output) {
        
        # Reactive function that sets the data to be used
        queryData <- reactive({
                switch(input$compute, 
                       ProdVolume={
                             subData <- riceData[, 1:2]
                       },
                       AreaHA={
                             subData <- riceData[, c(1,3)]
                       },
                       Yield={
                             x <- riceData[, "Year"]
                             y <- (riceData[, "ProdVolume"] / riceData[, "AreaHA"]) * 1000
                             subData <- cbind(x,y)
                             subData <- as.data.frame(subData)
                             subData[, 2] <- as.numeric(levels(subData[, 2]))[subData[, 2]]
                       },
                       Gross={
                             x <- riceData[, "Year"]
                             y <- (riceData[, "ProdVolume"] / riceData[, "AreaHA"]) * 1000
                             y <- y * riceData[, "DryPrice"]
                             subData <- cbind(x,y)
                             subData <- as.data.frame(subData)
                             subData[, 2] <- as.numeric(levels(subData[, 2]))[subData[, 2]]
                       }
                )
                return(subData)
        })
        
        # Reactive function that sets the y label axis
        label <- reactive({
                switch(input$compute, 
                       ProdVolume={
                               label <- "Production volume (MT)"
                       },
                       AreaHA={
                               label <- "Area harvested (Ha)"
                       },
                       Yield={
                               label <- "Yield per Hectare (Kg)"
                       },
                       Gross={
                               label <- "Gross returns per Hectare (PhP/Ha)"
                       }
                )
                return(label)
        })
        
        # Draws the ggplot bar graph of the selected category
        output$ricePlot <- renderPlot({
                p <- ggplot(data=queryData(), aes_string(x=names(queryData())[1], y=names(queryData())[2]))
                p <- p + geom_bar(stat="identity")
                p <- p + scale_y_continuous(labels = scales::comma)
                p <- p + xlab("Year") + ylab(label())
                p
        })
        
        # Computes and formats the average of the selected category
        output$riceAvg <- renderText(format({mean(queryData()[,2])}, big.mark=",", scientific=FALSE))
})