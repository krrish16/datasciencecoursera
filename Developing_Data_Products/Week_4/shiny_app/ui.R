library(shiny)
library(plotly)
shinyUI(fluidPage(
  titlePanel("Scatter Plots - Iris Dataset"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("x", "Select X-axis:",
                   list("Sepal.Length"='a', "Sepal.Width"='b', "Petal.Length"='c', "Petal.Width"='d')),
      radioButtons("y", "Select Y-axis:",
                   list("Sepal.Length"='e', "Sepal.Width"='f', "Petal.Length"='g', "Petal.Width"='h')),
      submitButton(text = "Apply Changes", icon("check-circle",lib = "font-awesome")
)
      
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Description",
                           p(h4("Scatter plot:")),
                           helpText("Switch to Plot tab, select the required column on X and Y Axes from sidepanel and Apply changes"),
                           HTML("This application is built using the <b>iris dataset</b> and gives the scatter plot for selected columns")                
                  ),
                  tabPanel("Plot", plotlyOutput("s_plot"))
      )
    )
  )
))