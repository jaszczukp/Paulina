library(DT)
library(plotly)

pageWithSidebar(
  headerPanel("TIMSS visualization"),
  sidebarPanel(
    radioButtons("subject", "Subject:",
                 list("Math", "Science")),
    checkboxGroupInput("checkGroup", label = ("Year"), 
                       choices = c("2015", "2019"),
                       selected = "2019"),
    selectInput("country_selection",
                label = "Country:",
                choices = M4_countries$Country,
                multiple = TRUE)),
  mainPanel(
    plotOutput("plot_1"),
    fluidRow(
      column(width = 12,
             box(
               title = "Score and percentiles", width = NULL, status = "primary",
               div(style = 'overflow-x: scroll', DT::dataTableOutput('table_1'))
             ))))
)
