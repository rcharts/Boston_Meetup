require(shiny)
require(rCharts)
shinyUI(pageWithSidebar(
  headerPanel("Bump Charts"),
  sidebarPanel(
    includeCSS('app.css'),
    selectInput('dataset', 'Choose Dataset', c('E0-1112.csv', 'E0-1213.csv'))
    # tags$link(href = 'app.css', rel = 'stylesheet')
  ),
  mainPanel(
   showOutput("bumpchart", "rickshaw") 
  )
))