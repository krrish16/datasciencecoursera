library(shiny)
library(plotly)
shinyServer(function(input, output) {
  output$s_plot <- renderPlotly({
    if(input$x=='a'){
      i<-1
    }
    
    if(input$x=='b'){
      i<-2
    }
    
    if(input$x=='c'){
      i<-3
    }
    
    if(input$x=='d'){
      i<-4
    }
    
    if(input$y=='e'){
      j<-1
    }
    
    if(input$y=='f'){
      j<-2
    }
    
    if(input$y=='g'){
      j<-3
    }
    
    if(input$y=='h'){
      j<-4
    }
    
    s    <- iris[, i]
    k    <- iris[, j]
    x_axis <- list(
      title = colnames(iris)[i]
    )
    y_axis <- list(
      title = colnames(iris)[j]
    )
    p <- plot_ly(x = s,y = k) %>%
      layout(xaxis = x_axis, yaxis = y_axis)
    p
    
  })
})