library(shiny)
shinyServer(function(input, output) {
    model <- reactive({
        brushed_data <- brushedPoints(mtcars, input$brush1,
                                      xvar = "wt", yvar = "mpg")
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(mpg ~ wt, data = brushed_data)
    })
    
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })
    
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })
    
    output$plot1 <- renderPlot({
        xlab <- ifelse(input$show_xlab, "Weight", "")
        ylab <- ifelse(input$show_ylab, "MPG", "")
        main <- ifelse(input$show_title, "Mpg vs Weight", "")
        plot(mtcars$wt, mtcars$mpg, xlab = xlab,
             ylab = ylab, main = main,
             cex = 1.5, pch = 16, bty = "n")
        if(!is.null(model())){
            abline(model(), col = "Green", lwd = 4)
        }
    })
    
    
})