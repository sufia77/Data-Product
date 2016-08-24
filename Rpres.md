Estimate Height for Father or Son
========================================================
author: Sufua Khatun
date: August 23, 2016
autosize: true



Introduction
========================================================

* The goal of this study was to  predict son's height from given father's height. There is a possibility that a tall father can have a short son, also a short father can have a tall son. This study can predict how much difference can be between a father and a son height.
* Data for this study was collected from Pearson's data. There are 1078 measurements of a father's height and his son's height in inches. Details can be found from the [link](http://stat-www.berkeley.edu/users/juliab/141C/pearson.dat).
The summary of this dataset:

```
'data.frame':	1078 obs. of  2 variables:
 $ fheight: num  65 63.3 65 65.8 61.1 ...
 $ sheight: num  59.8 63.2 63.3 62.8 64.3 ...
```

Regression Model
========================================================
Since, there are only two variables in this dataset, linear regression model was used to fit the dataset and predict the son's height. For an example, let's assume to predict son's height for father's height of 65 inches.

### Predicted Son Height for Father Height of 65 inches


```
   1 
67.3 
```

Plot of Predicted Son's height 
========================================================
<div class="col2">

![plot of chunk unnamed-chunk-3](Rpres-figure/unnamed-chunk-3-1.png)

*** 

- This is son's versus father's height data for predicting son's height for father's height of 65 inches.
- The blue line shows the fit from linear regression model and black horizontal line shows the predicted value that is 67.3 inches for father height of 65 inches.
- Interactive plot of this study will be found from the following shiny app [link](https://skhatun.shinyapps.io/PredictHeight/)

Main Code of Shiny App for Son's Height
=================

```r
function(input, output){
    fit1 <- lm(sheight~fheight, data = father.son)
    output$pred <- renderPrint({
        paste(round(as.numeric(predict(fit1, newdata=data.frame(fheight=input$height))),2))
    }) # Predicted value
    output$gplot <- renderPlot({
        g <- ggplot(data = father.son, aes(x=fheight, y=sheight))
        g + geom_point(col="light green") + geom_smooth(method = "lm")+
          geom_hline(yintercept = predict(fit1, newdata=data.frame(fheight=input$height)))
    }) # Plot with Predicted value
}
```

