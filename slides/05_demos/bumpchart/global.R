## @knitr getData
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

## @knitr getData2
getData2 <- function(dataURL){
  require(dplyr)
  df <- read.csv(dataURL, stringsAsFactors = F)
  df %.%
    select(Date, HomeTeam, AwayTeam, FTR) %.%
    transform(Date = as.Date(Date,  format = "%d/%m/%y"))
  
}


## @knitr getLeagueTable
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


## @knitr getLeagueTable2
# Compute the League Table on a Given Date
getLeagueTable2 <- function(date_, data_){
  dat <- subset(data_, date <= date_)
  dat2 <- ddply(dat, .(team), summarize,
    P = sum(points),
    G = length(points),
    W = sum(points == 3),
    D = sum(points == 1),
    L = sum(points == 0)
  )
  dat3 <- arrange(dat2, P)
  dat3 <- transform(dat3, rank = rank(P, ties.method = 'min'))
  arrange(dat3, rank)
}


## @knitr getBumpChartData
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


## @knitr plotBumpChart
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

## @knitr misc
# downloader::download('http://www.football-data.co.uk/mmz4281/1112/E0.csv', 'data/E0-1112.csv')
# get links to all premier league result tables from football-data
# require(XML)
# base_url <- "http://www.football-data.co.uk/englandm.php"
# doc <- htmlParse(base_url)
# links_r <- xpathSApply(doc, "//a[contains(@href, 'E0.csv')]", xmlGetAttr, 'href')
# links_a <- paste("http://www.football-data.co.uk/", links_r)

# url <- 'http://www.football-data.co.uk/mmz4281/1213/E0.csv'


# require(useR2013DAC)
# data(laliga)
# laliga <- transform(laliga, date )
# 
# 
# url <- 'http://www.football-data.co.uk/mmz4281/1213/SP1.csv'
# bData <- getBumpChartData(url)
# b1 <- plotBumpChart(bData)
# b1$yAxis(tickFormat = "#! function(n){return(n == 0 ? '': String(21 - n))} !#")
# 
# b1$hoverDetail(formatter = "#! function(series, x, y){
#   var info = series.info[String(x)];
#   var d = new Date(x * 1000).toUTCString();
#   return '<b>' + series.name + '</b><br><br>' + 
#   '<b>Position:</b> ' + String(21 - y)  +
#   '<br><b>Points:</b> ' + info.P +
#   '<br><b>Wins:</b> ' + info.W +
#   '<br><b>Draws:</b>' + info.D +
#   '<br><b>Losses:</b>' + info.L +
#   '<br><br>' + d
# } !#")