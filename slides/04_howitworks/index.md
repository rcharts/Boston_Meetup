---
title       : How it Works
subtitle    : rCharts
---




<iframe src="http://jsfiddle.net/RR8Ub/embedded/result,resources,js,html/presentation/" height=600 width=100%></iframe>

---

<iframe src="http://jsfiddle.net/RR8Ub/embedded/resources/presentation/" height=600 width=100%></iframe>

---

## Resources => Configuration (config.yml)

```yaml
uvcharts:
  jshead: [js/d3.v3.min.js, js/uvcharts.js]
  cdn:
    jshead:
      - "http://cdnjs.cloudflare.com/ajax/libs/d3/3.2.2/d3.v3.min.js"
      - "http://imaginea.github.io/uvCharts/js/uvcharts.js"
```

---

<iframe src="http://jsfiddle.net/RR8Ub/embedded/js/presentation/" height=600 width=100%></iframe>

--- .RAW

## Javascript => Layout (layouts/chart.html)

```js
<script>
  var graphdef = {{{ chartParams }}}
  var config = {
    meta: {
      position: "#{{ chartId }}"
    }
  }
  var chart = uv.chart(graphdef.type, graphdef, config)
</script>
```

---

## Data

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Thu Jan 23 06:18:22 2014 -->
<TABLE border=1>
<TR> <TH> Hair </TH> <TH> Eye </TH> <TH> Sex </TH> <TH> Freq </TH>  </TR>
  <TR> <TD> Black </TD> <TD> Brown </TD> <TD> Male </TD> <TD align="right"> 32.00 </TD> </TR>
  <TR> <TD> Brown </TD> <TD> Brown </TD> <TD> Male </TD> <TD align="right"> 53.00 </TD> </TR>
  <TR> <TD> Red </TD> <TD> Brown </TD> <TD> Male </TD> <TD align="right"> 10.00 </TD> </TR>
  <TR> <TD> Blond </TD> <TD> Brown </TD> <TD> Male </TD> <TD align="right"> 3.00 </TD> </TR>
  <TR> <TD> Black </TD> <TD> Blue </TD> <TD> Male </TD> <TD align="right"> 11.00 </TD> </TR>
  <TR> <TD> Brown </TD> <TD> Blue </TD> <TD> Male </TD> <TD align="right"> 50.00 </TD> </TR>
  <TR> <TD> Red </TD> <TD> Blue </TD> <TD> Male </TD> <TD align="right"> 10.00 </TD> </TR>
  <TR> <TD> Blond </TD> <TD> Blue </TD> <TD> Male </TD> <TD align="right"> 30.00 </TD> </TR>
  <TR> <TD> Black </TD> <TD> Hazel </TD> <TD> Male </TD> <TD align="right"> 10.00 </TD> </TR>
  <TR> <TD> Brown </TD> <TD> Hazel </TD> <TD> Male </TD> <TD align="right"> 25.00 </TD> </TR>
   </TABLE>


---

## JSON

```js
"dataset": {
  "Brown": [
    {"name": "Black", "value": 32 },
    {"name": "Brown", "value": 53 },
    {"name": "Red","value":  10},
    {"name": "Blond", "value": 3} 
  ],
  "Blue": [
    {"name": "Black", "value": 11 },
    {"name": "Brown", "value": 50 },
    {"name": "Red","value":  10},
    {"name": "Blond", "value": 30} 
  ],
  ...
} 
```

---

## Data => JSON


```r
make_dataset <- function(x, y, data, group = NULL){
  require(plyr)
  dat <- rename(data, setNames(c('name', 'value'), c(x, y)))
  dat <- dat[c('name', 'value', group)]
  if (!is.null(group)){
    dlply(dat, group, toJSONArray, json = F)
  } else {
    list(main = toJSONArray(dat, json = F)) 
  }
}
```


---

## Make Chart


```r
dataset = make_dataset('Hair', 'Freq', hair_eye_male, group = 'Eye')
u1 <- rCharts$new()
u1$setLib("uvcharts")
u1$set(
  type = 'Bar',
  categories = names(dataset),
  dataset = dataset,
  dom = 'chart1'
)
u1
```


---

<iframe src='
assets/fig/chart1.html
' scrolling='no' seamless
'rChart uvcharts '
id=iframe-
chart1
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


---

## Wrapper Function


```r
uvPlot <- function(x, y, data, group = NULL, type, ...){
  dataset = make_dataset(x = x, y = y, data = data, group = group)
  u1 <- rCharts$new()
  u1$setLib("uvcharts")
  u1$set(
    type = type,
    categories = names(dataset),
    dataset = dataset
  )
  return(u1)
}
```


---

## Links

1. [How it Works: Part 1](http://rcharts.io/howitworks)
2. [How it Works: Part 2](http://rcharts.io/howitworks/part2/)
2. [How it Works: Micropolar](http://rcharts.io/howitworks/micropolar)














