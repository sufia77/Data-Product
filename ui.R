#library(rsconnect)
#install.packages("shiny")
library(shiny)

shinyUI(
  navbarPage("Estimate Height: Son or Father",
             tabPanel("Analysis",
                      sidebarPanel(
                        radioButtons("outcome", "Select Outcome:", c("Son", "Father")),
                        numericInput('height', 'Enter Height: 60 to 75 inches',value = 65,  min = 55, max = 75),
                        submitButton('Submit')
                      ),
                      mainPanel(
                        tags$style(type="text/css",
                                   ".shiny-output-error { visibility: hidden; }",
                                   ".shiny-output-error:before { visibility: hidden; }"
                        ),
                        h3('select outcome and click submit to see predicted value'),
                        h4(textOutput('out2')),
                        verbatimTextOutput("out1"),
                        h4(textOutput('out3')),
                        verbatimTextOutput("pred"),
                        h4('Plot for Predicted Height'),
                        plotOutput("gplot")
                      )
               
             ),
             tabPanel("Details",
                      h3("Synopsis"),
                      helpText("This analysis using Pearson's data set on heights of fathers and their sons.",
                               "There are 1078 measurements of a father's height and his son's height.",
                               "There are two variables fheight (Father's height),",
                               "and sheight (Son's height)."),
                      h3("Goal"),
                      helpText("The purpose of this study is to predict either son's height from given father's",
                               "height or vice versa. In analysis page, you can select apropriate option",
                               "and press submit to get predicted value. For example, if you want to predict",
                               "son height then select son and type father's height and then press submit."),
                      h3("Source Code"),
                      helpText(a("github repo", "https://github.com/sufia77/Data-Product", target="_blank"))
                      
             )
    
  )
)