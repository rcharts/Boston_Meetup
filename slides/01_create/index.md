---
title       : rCharts
subtitle    : Interactive Visualizations from R
author      : Ramnath Vaidyanathan
hitheme     : solarized_light
license     : by-nc-sa
assets:
  js:
    - "http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"
    - "http://bartaz.github.io/sandbox.js/jquery.highlight.js"
--- .dark .nobackground .quote

<q>rCharts helps create, customize and share dynamic, interactive visualizations from R, using a consistent lattice-like plotting interface.</q>




--- .larger

## Quick Start

```r
library(devtools)
pkgs <- c("slidify", "slidifyLibraries", "rCharts")
install_github(pkgs, 'ramnathv')
```

---

<q> rCharts helps __create__, customize and share dynamic, interactive visualizations from R, using a consistent lattice-like plotting interface.</q>

--- .larger


```r
library(rCharts)
rPlot(mpg ~ wt | gear, data = mtcars, type = 'point')
```

<iframe src='
assets/fig/plot1.html
' scrolling='no' seamless
'rChart polycharts '
id=iframe-
chart4a545817f5a7
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


--- .larger


```r
nPlot(mpg ~ wt, group = 'gear', data = mtcars, 
  type = 'scatterChart'
)
```

<iframe src='
assets/fig/plot2.html
' scrolling='no' seamless
'rChart nvd3 '
id=iframe-
chart4a543166878b
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


---

## Leaflet Map


```r
map3 <- Leaflet$new()
map3$setView(c(51.505, -0.09), zoom = 13)
map3$tileLayer(
  provider = "Stamen.Watercolor",
  maxZoom = 18 
)
map3$marker(c(51.5, -0.09), bindPopup = "<p> Hi. I am a popup </p>")
map3$set(height = 590, width = 950)
map3
```


--- #leaflet-map

<iframe src='
assets/fig/unnamed-chunk-1.html
' scrolling='no' seamless
'rChart leaflet '
id=iframe-
chart4a546cab11c6
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


<style>#leaflet-map iframe{height: 600px;}</style>

--- #highcharts

## HighCharts


```r
h1 <- hPlot(x = "Wr.Hnd", y = "NW.Hnd", 
  data = MASS::survey, 
  type = c("line", "bubble", "scatter"), 
  group = "Clap", 
  size = "Age"
)
h1
```


---

<iframe src='
assets/fig/unnamed-chunk-3.html
' scrolling='no' seamless
'rChart highcharts '
id=iframe-
chart4cdd3a743bc3
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


<style>#highcharts iframe{height: 600px;}</style>


