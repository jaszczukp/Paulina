library(DT)
library(ggplot2)
library(plotly)
library(readxl)
library(dplyr)

function(input, output, session){
  
  output$plot_1 <- renderPlot({
    
    if(input$subject == "Math"){
      if(length(input$checkGroup) == 1){
        if(input$checkGroup == "2015"){
          data <- M4_2015[M4_2015$Country %in% input$country_selection, c("Country", "Score")]
          ggplot(data, aes(x = Country, y = Score)) +
            geom_bar(fill = "salmon", stat = "identity") +
            coord_flip() +
            ylab("Score in 2015") +
            ggtitle("Mathematics Achievement") +
            theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 20))
        }
        else {
          data <- M4_2019[M4_2019$Country %in% input$country_selection, c("Country", "Score")]
          ggplot(data, aes(x = Country, y = Score)) +
            geom_bar(fill = "turquoise3", stat = "identity") +
            coord_flip() +
            ylab("Score in 2019") +
            ggtitle("Mathematics Achievement") +
            theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 20))
        }
      }
      else if(length(input$checkGroup) == 2){
        data <- M4[M4$Country %in% input$country_selection, c("Country", "Score", "Year")]
        ggplot(data, aes(x = Country, y = Score, fill = Year)) +
          geom_bar(position="dodge", stat = "identity") +
          coord_flip() +
          ggtitle("Mathematics Achievement") +
          theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 20))
      }
    }
    
    else {
      if(length(input$checkGroup) == 1){
        if(input$checkGroup == "2015"){
          data <- S4_2015[S4_2015$Country %in% input$country_selection, c("Country", "Score")]
          ggplot(data, aes(x = Country, y = Score)) +
            geom_bar(fill = "salmon", stat = "identity") +
            coord_flip() +
            ylab("Score in 2015") +
            ggtitle("Science Achievement") +
            theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 20))
        }
        else {
          data <- S4_2019[S4_2019$Country %in% input$country_selection, c("Country", "Score")]
          ggplot(data, aes(x = Country, y = Score)) +
            geom_bar(fill = "turquoise3", stat = "identity") +
            coord_flip() +
            ylab("Score in 2019") +
            ggtitle("Science Achievement") +
            theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 20))
        }
      }
      else if(length(input$checkGroup) == 2){
        data <- S4[S4$Country %in% input$country_selection, c("Country", "Score", "Year")]
        ggplot(data, aes(x = Country, y = Score, fill = Year)) +
          geom_bar(position="dodge", stat = "identity") +
          coord_flip() +
          ggtitle("Science Achievement") +
          theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 20))
      }
    }
    
  })
  
  output$table_1 <- DT::renderDataTable({
    if(input$subject == "Math"){
      if(length(input$checkGroup) == 1){
        if(input$checkGroup == "2015"){
          data <- M4_2015[M4_2015$Country %in% input$country_selection, c("Country", "Score", "5th_percentile", "25th_percentile", "75th_percentile", "95th_percentile")]
          DT::datatable(data)
        }
        else if(input$checkGroup == "2019"){
          data <- M4_2019[M4_2019$Country %in% input$country_selection, c("Country", "Score", "5th_percentile", "25th_percentile", "75th_percentile", "95th_percentile")]
          DT::datatable(data)
        }
      }
      else if(length(input$checkGroup) == 2){
        data <- M4_table[M4_table$Country %in% input$country_selection, c("Country", "Score2015", "5th_percentile2015", "25th_percentile2015",
                                                                          "75th_percentile2015", "95th_percentile2015",
                                                                          "Score2019", "5th_percentile2019",
                                                                          "25th_percentile2019", "75th_percentile2019",
                                                                          "95th_percentile2019")]
        DT::datatable(data)
      }
    }
    else {
      if(length(input$checkGroup) == 1){
        if(input$checkGroup == "2015"){
          data <- S4_2015[S4_2015$Country %in% input$country_selection, c("Country", "Score", "5th_percentile", "25th_percentile", "75th_percentile", "95th_percentile")]
          DT::datatable(data)
        }
        else if(input$checkGroup == "2019"){
          data <- S4_2019[S4_2019$Country %in% input$country_selection, c("Country", "Score", "5th_percentile", "25th_percentile", "75th_percentile", "95th_percentile")]
          DT::datatable(data)
        }
      }
      else if(length(input$checkGroup) == 2){
        data <- S4_table[S4_table$Country %in% input$country_selection, c("Country", "Score2015", "5th_percentile2015", "25th_percentile2015",
                                                                          "75th_percentile2015", "95th_percentile2015",
                                                                          "Score2019", "5th_percentile2019",
                                                                          "25th_percentile2019", "75th_percentile2019",
                                                                          "95th_percentile2019")]
        DT::datatable(data)}
      
    }
  })
  
}
