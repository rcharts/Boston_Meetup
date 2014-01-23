---
title       : Interactivity
subtitle    : rCharts
--- .dark .nobackground .quote




---

## Create Chart


```r
library(rCharts)
r1 <- rPlot(mpg ~ wt, 
  data = mtcars, 
  color = "gear", 
  type = "point"
)
r1
```


---

<iframe src='
assets/fig/chart1.html
' scrolling='no' seamless
'rChart polycharts '
id=iframe-
chart4cdd4f9f0954
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>



--- .segue .dark .nobackground

## Client Side Interactivity

---

## AngularJS Controls


```r
r1$addControls('x', 'mpg', names(mtcars))
r1
```


---

<iframe src='
assets/fig/chart2.html
' scrolling='no' seamless
'rChart polycharts '
id=iframe-
chart4cdd4f9f0954
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


---


```r
r1$addControls('x', 'mpg', names(mtcars))
r1$addControls('color', 'cyl', names(mtcars))
r1
```


---


<iframe src='
assets/fig/chart3.html
' scrolling='no' seamless
'rChart polycharts '
id=iframe-
chart4cdd4f9f0954
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


---


```r
HairEye <- subset(as.data.frame(HairEyeColor), Sex == "Male")
n1 <- nPlot(Freq ~ Eye, 
  data = HairEye, 
  group = 'Hair', 
  type = 'multiBarChart'
)
n1
```


---

<iframe src='
assets/fig/chart4.html
' scrolling='no' seamless
'rChart nvd3 '
id=iframe-
chart4cdd1385f3cc
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


--- .segue .dark .nobackground

## DatGUI Controls

---


```r
n1$addControls("type", "multiBarChart", 
  values = c('multiBarChart', 'multiBarHorizontalChart')
)
n1$setTemplate(script = 
 system.file('libraries', 'nvd3', 
  'controls', 'datgui.html', 
  package = 'rCharts'
 )
)
n1
```


---

<iframe src='
assets/fig/chart5.html
' scrolling='no' seamless
'rChart nvd3 '
id=iframe-
chart4cdd1385f3cc
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


---

## More Controls


```r
hair_eye_male = as.data.frame(HairEyeColor)
n2 <- nPlot(Freq ~ Hair, 
  group = 'Eye', 
  data = hair_eye_male, 
  type = 'multiBarChart'
)
n2$addFilters("Sex")
n2
```


---

<iframe src='
assets/fig/chart6.html
' scrolling='no' seamless
'rChart nvd3 '
id=iframe-
chart4cddfbf6061
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


--- .segue .dark .nobackground

## Server Side Interactivity

---

## Shiny


```r
library(shiny)
runApp(list(
  ui = pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
      selectInput("x", "", names(mtcars), "wt")  
    ),
    mainPanel(
      chartOutput("r1", "polycharts")
    )
  ),
  server = function(input, output){
    output$r1 <- renderChart2({
      rPlot(x = input$x, y = "mpg", data = mtcars, type = 'point')
    })
  }
))
```
















