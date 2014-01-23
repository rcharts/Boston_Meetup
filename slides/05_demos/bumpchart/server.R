require(shiny)
require(rCharts)
shinyServer(function(input, output, session){
  output$bumpchart <- renderChart2({
    url <- sprintf('data/%s', input$dataset)
    bData <- getBumpChartData(url)
    b1 <- plotBumpChart(bData)
    b1$yAxis(tickFormat = "#! function(n){
      return(n == 0 ? '': String(21 - n))
    } !#")
    b1$set(height = 400, width = 600)
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
    b1
  })
})