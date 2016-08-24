library(shiny)
library(datasets)
library(UsingR)
library(ggplot2)

data("father.son")

shinyServer(
  function(input, output){
    
    output$out1 <- renderPrint({input$height})
    output$out2 <- renderPrint({
      if(input$outcome == "Son")
        cat("You entered height for : Father")
      else
        cat("You entered height for : Son")
    })
    
    output$out3 <- renderPrint({
      if(input$outcome == "Son")
        cat("Predicted height for : Son")
      else
        cat("Predicted height for : Father")
    })
    
    fit1 <- lm(sheight~fheight, data = father.son)
    fit2 <- lm(fheight~sheight, data = father.son)
    
    output$pred <- renderPrint({
      if(input$outcome == "Son"){
       print(round(as.numeric(predict(fit1, newdata = data.frame(fheight = input$height))),2), quote = FALSE)
      }
      else{
        print(round(as.numeric(predict(fit2, newdata = data.frame(sheight = input$height))),2),quote = FALSE)
      }
        
    })
    
    output$gplot <- renderPlot({
      if(input$outcome == "Son"){
        g <- ggplot(data = father.son, aes(x=fheight, y=sheight))
        g + geom_point(col="light green") + geom_smooth(method = "lm")+
          geom_hline(yintercept = predict(fit1, newdata = data.frame(fheight = input$height)))+
          geom_vline(xintercept = input$height)+
          labs(x="Fathers Height (inches)", y="Sons Height (inches)")+
          ggtitle("Sons versus Fathers Height")
      }

      else{
        g1 <- ggplot(data = father.son, aes(x=sheight, y=fheight))
        g1 + geom_point(col="grey") + geom_smooth(method = "lm")+
          geom_hline(yintercept = predict(fit2, newdata = data.frame(sheight = input$height)))+
          geom_vline(xintercept = input$height)+
          labs(x="Sons Height (inches)", y="Fathers Height (inches)")+
          ggtitle("Fathers versus Sons Height")
      }
    })
  }
)
