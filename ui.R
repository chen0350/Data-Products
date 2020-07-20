library(shiny)
shinyUI(fluidPage(
    titlePanel("Cars - Dynamic Regression Line Plotting"),
    sidebarLayout(
        sidebarPanel(
            h4("This app allows user to dynamically select certain car weights to determine the regression line of miles per gallon. Drag and select points to determine the regression line"),
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut"),
            checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
            checkboxInput("show_title", "Show/Hide Title")
            
        ),
        mainPanel(
            plotOutput("plot1", brush = brushOpts(
                id = "brush1"
            ))
            
        )
    )
))
