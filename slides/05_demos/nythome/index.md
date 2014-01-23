---
title       : NYT Home Prices
subtitle    : Customizing Visualizations
--- &tabs





## Get Data


*** 

## Code


```r
require(PerformanceAnalytics)
data(managers)
managers <- na.omit(managers)
data_ = data.frame(
  date = format(index(managers), "%Y-%m-%d"),
  coredata(cumprod(managers + 1)*100)
)
```


*** .active

## Data

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Thu Jan 23 04:20:30 2014 -->
<TABLE border=1>
<TR> <TH> date </TH> <TH> HAM1 </TH> <TH> HAM2 </TH> <TH> HAM3 </TH> <TH> HAM4 </TH> <TH> HAM5 </TH> <TH> HAM6 </TH> <TH> EDHEC.LS.EQ </TH> <TH> SP500.TR </TH> <TH> US.10Y.TR </TH> <TH> US.3m.TR </TH>  </TR>
  <TR> <TD> 2001-09-30 </TD> <TD align="right"> 96.88 </TD> <TD align="right"> 103.33 </TD> <TD align="right"> 99.32 </TD> <TD align="right"> 89.25 </TD> <TD align="right"> 99.30 </TD> <TD align="right"> 100.23 </TD> <TD align="right"> 96.52 </TD> <TD align="right"> 91.92 </TD> <TD align="right"> 102.28 </TD> <TD align="right"> 100.43 </TD> </TR>
  <TR> <TD> 2001-10-31 </TD> <TD align="right"> 96.99 </TD> <TD align="right"> 101.06 </TD> <TD align="right"> 97.28 </TD> <TD align="right"> 93.42 </TD> <TD align="right"> 86.19 </TD> <TD align="right"> 103.69 </TD> <TD align="right"> 97.48 </TD> <TD align="right"> 93.68 </TD> <TD align="right"> 105.14 </TD> <TD align="right"> 100.69 </TD> </TR>
  <TR> <TD> 2001-11-30 </TD> <TD align="right"> 100.28 </TD> <TD align="right"> 101.89 </TD> <TD align="right"> 99.70 </TD> <TD align="right"> 100.27 </TD> <TD align="right"> 88.26 </TD> <TD align="right"> 108.81 </TD> <TD align="right"> 99.43 </TD> <TD align="right"> 100.86 </TD> <TD align="right"> 101.74 </TD> <TD align="right"> 100.91 </TD> </TR>
  <TR> <TD> 2001-12-31 </TD> <TD align="right"> 107.06 </TD> <TD align="right"> 101.85 </TD> <TD align="right"> 99.88 </TD> <TD align="right"> 111.69 </TD> <TD align="right"> 92.53 </TD> <TD align="right"> 114.26 </TD> <TD align="right"> 101.21 </TD> <TD align="right"> 101.75 </TD> <TD align="right"> 99.95 </TD> <TD align="right"> 101.07 </TD> </TR>
  <TR> <TD> 2002-01-31 </TD> <TD align="right"> 108.51 </TD> <TD align="right"> 99.94 </TD> <TD align="right"> 98.43 </TD> <TD align="right"> 107.84 </TD> <TD align="right"> 100.36 </TD> <TD align="right"> 116.49 </TD> <TD align="right"> 100.84 </TD> <TD align="right"> 100.26 </TD> <TD align="right"> 100.45 </TD> <TD align="right"> 101.21 </TD> </TR>
  <TR> <TD> 2002-02-28 </TD> <TD align="right"> 107.16 </TD> <TD align="right"> 96.23 </TD> <TD align="right"> 94.35 </TD> <TD align="right"> 105.12 </TD> <TD align="right"> 99.50 </TD> <TD align="right"> 118.00 </TD> <TD align="right"> 99.60 </TD> <TD align="right"> 98.33 </TD> <TD align="right"> 101.73 </TD> <TD align="right"> 101.35 </TD> </TR>
  <TR> <TD> 2002-03-31 </TD> <TD align="right"> 107.84 </TD> <TD align="right"> 98.36 </TD> <TD align="right"> 96.31 </TD> <TD align="right"> 119.60 </TD> <TD align="right"> 92.29 </TD> <TD align="right"> 123.88 </TD> <TD align="right"> 101.14 </TD> <TD align="right"> 102.02 </TD> <TD align="right"> 97.96 </TD> <TD align="right"> 101.50 </TD> </TR>
  <TR> <TD> 2002-04-30 </TD> <TD align="right"> 108.33 </TD> <TD align="right"> 97.22 </TD> <TD align="right"> 93.87 </TD> <TD align="right"> 126.87 </TD> <TD align="right"> 96.53 </TD> <TD align="right"> 124.46 </TD> <TD align="right"> 100.72 </TD> <TD align="right"> 95.84 </TD> <TD align="right"> 100.76 </TD> <TD align="right"> 101.66 </TD> </TR>
  <TR> <TD> 2002-05-31 </TD> <TD align="right"> 108.17 </TD> <TD align="right"> 94.35 </TD> <TD align="right"> 93.64 </TD> <TD align="right"> 127.10 </TD> <TD align="right"> 91.29 </TD> <TD align="right"> 122.23 </TD> <TD align="right"> 100.38 </TD> <TD align="right"> 95.13 </TD> <TD align="right"> 101.61 </TD> <TD align="right"> 101.82 </TD> </TR>
  <TR> <TD> 2002-06-30 </TD> <TD align="right"> 105.56 </TD> <TD align="right"> 91.16 </TD> <TD align="right"> 89.42 </TD> <TD align="right"> 121.09 </TD> <TD align="right"> 86.99 </TD> <TD align="right"> 119.47 </TD> <TD align="right"> 97.88 </TD> <TD align="right"> 88.36 </TD> <TD align="right"> 103.70 </TD> <TD align="right"> 101.97 </TD> </TR>
   </TABLE>



--- .bigger &tabs

## Process Data

*** 

## Code


```r
require(reshape2)
# melt data frame into long form
data_m <- melt(data_, id = "date", 
  variable.name = 'manager', 
  value.name = 'val'
)
```


*** .active

## Data

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Thu Jan 23 04:20:30 2014 -->
<TABLE border=1>
<TR> <TH> date </TH> <TH> manager </TH> <TH> val </TH>  </TR>
  <TR> <TD> 2001-09-30 </TD> <TD> HAM1 </TD> <TD align="right"> 96.88 </TD> </TR>
  <TR> <TD> 2001-10-31 </TD> <TD> HAM1 </TD> <TD align="right"> 96.99 </TD> </TR>
  <TR> <TD> 2001-11-30 </TD> <TD> HAM1 </TD> <TD align="right"> 100.28 </TD> </TR>
  <TR> <TD> 2001-12-31 </TD> <TD> HAM1 </TD> <TD align="right"> 107.06 </TD> </TR>
  <TR> <TD> 2002-01-31 </TD> <TD> HAM1 </TD> <TD align="right"> 108.51 </TD> </TR>
  <TR> <TD> 2002-02-28 </TD> <TD> HAM1 </TD> <TD align="right"> 107.16 </TD> </TR>
  <TR> <TD> 2002-03-31 </TD> <TD> HAM1 </TD> <TD align="right"> 107.84 </TD> </TR>
  <TR> <TD> 2002-04-30 </TD> <TD> HAM1 </TD> <TD align="right"> 108.33 </TD> </TR>
  <TR> <TD> 2002-05-31 </TD> <TD> HAM1 </TD> <TD align="right"> 108.17 </TD> </TR>
  <TR> <TD> 2002-06-30 </TD> <TD> HAM1 </TD> <TD align="right"> 105.56 </TD> </TR>
   </TABLE>


--- .bigger

## Visualize Data


```r
require(rCharts)

# initialize chart and set path to chart library
p2 <- rCharts$new()
p2$setLib('nyt_home')

# pass description, plot data and groups variable
p2$set(
  description = "This data comes from the managers dataset 
  included in the R package PerformanceAnalytics.",
  data = data_m,
  groups = "manager",
  height = 0,
  width = 0
)
p2
```


---

<iframe src='
fig/unnamed-chunk-5.html
' scrolling='no' seamless
'rChart nyt_home '
id=iframe-
chart4a542768b445
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


<style>
  iframe.nyt-home{width: 600px;}
  li.tab::before{content: ""}
</style>

<div class="source">
Source: <a href="http://www.nytimes.com/interactive/2011/05/31/business/economy/case-shiller-index.html">NY Times</a>
</div>



