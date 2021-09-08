### load packages
library(shiny)
library(tidyverse)
library(plotly)
library(shinyMatrix)

### define default plot and matrix settings and and read in data
rateInputs_m <- matrix(c(0,10,15,26,29,39,70,0.78,1.05,1.21,0.67,0.61,0.67,0.67),nrow=7,ncol=2,dimnames = list(NULL,c("Time","Speed")))

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Plotly and Shiny Matrix Input Demonstration"),
    
    column(4,
           radioButtons("toggleInputSelect","Input Method:",
                        choices= c("Drag and Drop"="dragDrop","Hand Typed"="handTyped")),
           br(),
           conditionalPanel(
               condition="input.toggleInputSelect=='dragDrop'",
               br(),
               br(),
               plotlyOutput("speed_p",height="250px")),
           conditionalPanel(
               condition="input.toggleInputSelect=='handTyped'",
               matrixInput("rateInputs_mi",value=rateInputs_m,class="numeric",row=list(names=FALSE)))),
    column(8,
           tabsetPanel(id = "tabs",
                       tabPanel("Algorithm Tab",value = "algorithmOutput",
                                tableOutput("table1")))
           )
)
