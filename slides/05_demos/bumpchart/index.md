---
title       : Bump Chart
subtitle    : Customizing Visualizations
---

<iframe src='fig/bchart2.html' width=100% height=600 seamless></iframe>

--- .segue .dark .nobackground




## Get Data

---

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Thu Jan 23 05:10:16 2014 -->
<TABLE border=1>
<TR> <TH> Date </TH> <TH> HomeTeam </TH> <TH> AwayTeam </TH> <TH> FTR </TH>  </TR>
  <TR> <TD> 13/08/11 </TD> <TD> Blackburn </TD> <TD> Wolves </TD> <TD> A </TD> </TR>
  <TR> <TD> 13/08/11 </TD> <TD> Fulham </TD> <TD> Aston Villa </TD> <TD> D </TD> </TR>
  <TR> <TD> 13/08/11 </TD> <TD> Liverpool </TD> <TD> Sunderland </TD> <TD> D </TD> </TR>
  <TR> <TD> 13/08/11 </TD> <TD> Newcastle </TD> <TD> Arsenal </TD> <TD> D </TD> </TR>
  <TR> <TD> 13/08/11 </TD> <TD> QPR </TD> <TD> Bolton </TD> <TD> A </TD> </TR>
  <TR> <TD> 13/08/11 </TD> <TD> Wigan </TD> <TD> Norwich </TD> <TD> D </TD> </TR>
  <TR> <TD> 14/08/11 </TD> <TD> Stoke </TD> <TD> Chelsea </TD> <TD> D </TD> </TR>
  <TR> <TD> 14/08/11 </TD> <TD> West Brom </TD> <TD> Man United </TD> <TD> A </TD> </TR>
  <TR> <TD> 15/08/11 </TD> <TD> Man City </TD> <TD> Swansea </TD> <TD> H </TD> </TR>
  <TR> <TD> 20/08/11 </TD> <TD> Arsenal </TD> <TD> Liverpool </TD> <TD> A </TD> </TR>
  <TR> <TD> 20/08/11 </TD> <TD> Aston Villa </TD> <TD> Blackburn </TD> <TD> H </TD> </TR>
  <TR> <TD> 20/08/11 </TD> <TD> Chelsea </TD> <TD> West Brom </TD> <TD> H </TD> </TR>
  <TR> <TD> 20/08/11 </TD> <TD> Everton </TD> <TD> QPR </TD> <TD> A </TD> </TR>
  <TR> <TD> 20/08/11 </TD> <TD> Sunderland </TD> <TD> Newcastle </TD> <TD> A </TD> </TR>
  <TR> <TD> 20/08/11 </TD> <TD> Swansea </TD> <TD> Wigan </TD> <TD> D </TD> </TR>
   </TABLE>


--- .segue .dark .nobackground

## Reshape Data

--- &tabs

***

## Code


```r
# Get data from URL: "http://www.football-data.co.uk/englandm.php"
getData <- function(dataURL){
  require(reshape2); require(plyr)
  # read data, extract columns
  df <- read.csv(dataURL, stringsAsFactors = F)
  df <- df[, c("Date", "HomeTeam", "AwayTeam", "FTR")]
  df <- rename(df, c(Date = "date", HomeTeam = "H", AwayTeam = "A"))
  df$date <- as.Date(df$date, format = "%d/%m/%y")
  # convert to long form, arrange by date, and add points
  dfm <- melt(df, measure.vars = c("H", "A"), 
    variable.name = "loc", value.name = 'team')
  dfm <- arrange(dfm, date)

  dfm <- mutate(dfm, 
    loc = as.character(loc), 
    points = 3*(loc == FTR) + 1*(FTR == 'D')
  )
  return(dfm)
}
```


*** .active

## Data

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Thu Jan 23 05:09:46 2014 -->
<TABLE border=1>
<TR> <TH> date </TH> <TH> FTR </TH> <TH> loc </TH> <TH> team </TH> <TH> points </TH>  </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> A </TD> <TD> H </TD> <TD> Blackburn </TD> <TD align="right"> 0.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> H </TD> <TD> Fulham </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> H </TD> <TD> Liverpool </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> H </TD> <TD> Newcastle </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> A </TD> <TD> H </TD> <TD> QPR </TD> <TD align="right"> 0.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> H </TD> <TD> Wigan </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> A </TD> <TD> A </TD> <TD> Wolves </TD> <TD align="right"> 3.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> A </TD> <TD> Aston Villa </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> A </TD> <TD> Sunderland </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> A </TD> <TD> Arsenal </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> A </TD> <TD> A </TD> <TD> Bolton </TD> <TD align="right"> 3.00 </TD> </TR>
  <TR> <TD align="right"> 15199.00 </TD> <TD> D </TD> <TD> A </TD> <TD> Norwich </TD> <TD align="right"> 1.00 </TD> </TR>
  <TR> <TD align="right"> 15200.00 </TD> <TD> D </TD> <TD> H </TD> <TD> Stoke </TD> <TD align="right"> 1.00 </TD> </TR>
   </TABLE>



--- .segue .dark .nobackground

## Get League Table

--- &tabs

*** 

## Code


```r
getLeagueTable <- function(date_, data_){
  require(dplyr)
  data_ %.%
    filter(date <= date_) %.%
    group_by(team) %.%
    summarise(
      P = sum(points),
      G = length(points),
      W = sum(points == 3),
      D = sum(points == 1),
      L = sum(points == 0)
    ) %.%
    transform(
      rank = rank(P, ties.method = 'min') 
    ) %.%
    arrange(rank)
}
```


*** .active

## Data

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Thu Jan 23 05:09:46 2014 -->
<TABLE border=1>
<TR> <TH> team </TH> <TH> P </TH> <TH> G </TH> <TH> W </TH> <TH> D </TH> <TH> L </TH> <TH> rank </TH>  </TR>
  <TR> <TD> Wolves </TD> <TD align="right"> 25.00 </TD> <TD align="right">  38 </TD> <TD align="right">   5 </TD> <TD align="right">  10 </TD> <TD align="right">  23 </TD> <TD align="right">   1 </TD> </TR>
  <TR> <TD> Blackburn </TD> <TD align="right"> 31.00 </TD> <TD align="right">  38 </TD> <TD align="right">   8 </TD> <TD align="right">   7 </TD> <TD align="right">  23 </TD> <TD align="right">   2 </TD> </TR>
  <TR> <TD> Bolton </TD> <TD align="right"> 36.00 </TD> <TD align="right">  38 </TD> <TD align="right">  10 </TD> <TD align="right">   6 </TD> <TD align="right">  22 </TD> <TD align="right">   3 </TD> </TR>
  <TR> <TD> QPR </TD> <TD align="right"> 37.00 </TD> <TD align="right">  38 </TD> <TD align="right">  10 </TD> <TD align="right">   7 </TD> <TD align="right">  21 </TD> <TD align="right">   4 </TD> </TR>
  <TR> <TD> Aston Villa </TD> <TD align="right"> 38.00 </TD> <TD align="right">  38 </TD> <TD align="right">   7 </TD> <TD align="right">  17 </TD> <TD align="right">  14 </TD> <TD align="right">   5 </TD> </TR>
  <TR> <TD> Wigan </TD> <TD align="right"> 43.00 </TD> <TD align="right">  38 </TD> <TD align="right">  11 </TD> <TD align="right">  10 </TD> <TD align="right">  17 </TD> <TD align="right">   6 </TD> </TR>
  <TR> <TD> Stoke </TD> <TD align="right"> 45.00 </TD> <TD align="right">  38 </TD> <TD align="right">  11 </TD> <TD align="right">  12 </TD> <TD align="right">  15 </TD> <TD align="right">   7 </TD> </TR>
  <TR> <TD> Sunderland </TD> <TD align="right"> 45.00 </TD> <TD align="right">  38 </TD> <TD align="right">  11 </TD> <TD align="right">  12 </TD> <TD align="right">  15 </TD> <TD align="right">   7 </TD> </TR>
  <TR> <TD> Swansea </TD> <TD align="right"> 47.00 </TD> <TD align="right">  38 </TD> <TD align="right">  12 </TD> <TD align="right">  11 </TD> <TD align="right">  15 </TD> <TD align="right">   9 </TD> </TR>
  <TR> <TD> West Brom </TD> <TD align="right"> 47.00 </TD> <TD align="right">  38 </TD> <TD align="right">  13 </TD> <TD align="right">   8 </TD> <TD align="right">  17 </TD> <TD align="right">   9 </TD> </TR>
  <TR> <TD> Norwich </TD> <TD align="right"> 47.00 </TD> <TD align="right">  38 </TD> <TD align="right">  12 </TD> <TD align="right">  11 </TD> <TD align="right">  15 </TD> <TD align="right">   9 </TD> </TR>
  <TR> <TD> Liverpool </TD> <TD align="right"> 52.00 </TD> <TD align="right">  38 </TD> <TD align="right">  14 </TD> <TD align="right">  10 </TD> <TD align="right">  14 </TD> <TD align="right">  12 </TD> </TR>
  <TR> <TD> Fulham </TD> <TD align="right"> 52.00 </TD> <TD align="right">  38 </TD> <TD align="right">  14 </TD> <TD align="right">  10 </TD> <TD align="right">  14 </TD> <TD align="right">  12 </TD> </TR>
   </TABLE>


--- .segue .dark .nobackground

## Get Bump Chart Data

--- &tabs

***

## Code


```r
#' Format data for the bump chart
getBumpChartData <- function(url){
  require(plyr)
  #' function to convert dates to seconds for javascript
  to_jsdate <- function(date_){
    val = as.POSIXct(as.Date(date_),origin = "1970-01-01")
    as.numeric(val)
  }
  dfm <- getData(url)
  bumpChartData <- ldply(unique(dfm$date), function(date_){
    cbind(getLeagueTable2(date_, dfm), date = to_jsdate(date_))
  })
  return(bumpChartData)
}
```


*** .active

## Data

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Thu Jan 23 05:09:47 2014 -->
<TABLE border=1>
<TR> <TH> team </TH> <TH> P </TH> <TH> G </TH> <TH> W </TH> <TH> D </TH> <TH> L </TH> <TH> rank </TH> <TH> date </TH>  </TR>
  <TR> <TD> Blackburn </TD> <TD align="right"> 0.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   1 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> QPR </TD> <TD align="right"> 0.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   1 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Arsenal </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Aston Villa </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Fulham </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Liverpool </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Newcastle </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Norwich </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Sunderland </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Wigan </TD> <TD align="right"> 1.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   3 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Bolton </TD> <TD align="right"> 3.00 </TD> <TD align="right">   1 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   0 </TD> <TD align="right">  11 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Wolves </TD> <TD align="right"> 3.00 </TD> <TD align="right">   1 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   0 </TD> <TD align="right">  11 </TD> <TD align="right"> 1313193600.00 </TD> </TR>
  <TR> <TD> Blackburn </TD> <TD align="right"> 0.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   1 </TD> <TD align="right"> 1313280000.00 </TD> </TR>
  <TR> <TD> QPR </TD> <TD align="right"> 0.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   1 </TD> <TD align="right"> 1313280000.00 </TD> </TR>
  <TR> <TD> West Brom </TD> <TD align="right"> 0.00 </TD> <TD align="right">   1 </TD> <TD align="right">   0 </TD> <TD align="right">   0 </TD> <TD align="right">   1 </TD> <TD align="right">   1 </TD> <TD align="right"> 1313280000.00 </TD> </TR>
   </TABLE>


--- .segue .dark .nobackground

## Visualize Data

--- &tabs .larger


*** .active 

## Code


```r
#' Plot the data
plotBumpChart <- function(bData, interpolation = 'basis'){
  require(rCharts);
  b1 <- Rickshaw$new()
  mycolors = ggthemes::tableau_color_pal("tableau20")(20)
  b1$layer(
    rank ~ date, 
    group = 'team', 
    data = bData, 
    type = 'line', 
    interpolation = interpolation, 
    colors = mycolors
  )
  b1$set(slider = TRUE)
  return(b1)
}
```


***

## Plot

<iframe src='
fig/bchart1.html
' scrolling='no' seamless
'rChart rickshaw '
id=iframe-
chart4cdd458b321c
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


--- .segue .dark .nobackground

## Customize Popup

--- &tabs .larger

*** .active

## Code


```r
b1$yAxis(tickFormat = "#! function(n){
  return(n == 0 ? '': String(21 - n))
} !#")
b1$hoverDetail(formatter = "#! function(series, x, y){
  var info = series.info[String(x)];
  var d = new Date(x * 1000).toUTCString();
  return '<b>' + series.name + '</b><br><br>' + 
  '<b>Position:</b> ' + String(21 - y)  +
  '<br><b>Points:</b> ' + info.P +
  '<br><b>Wins:</b> ' + info.W +
  '<br><b>Draws:</b>' + info.D +
  '<br><b>Losses:</b>' + info.L +
  '<br><br>' + d
} !#")
```


***

## Plot

<iframe src='
fig/bchart2.html
' scrolling='no' seamless
'rChart rickshaw '
id=iframe-
chart4cdd458b321c
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


<style>
  li.tab::before{content: ""}
  slide.larger pre {
    font-size: 28px;
    line-height: 32px;  
  }
</style>
