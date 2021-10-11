library(shiny)
library(tidyverse)

# Column names in mall customer data excluded since not great visual in clustering
#data_choice <- c("Customer_ID", "Gender", "Age", "Annual_income", "Spending_score")
data_choice <- c("Customer_ID", "Age", "Annual_income", "Spending_score")


# Define UI

ui <- fluidPage(
    
    titlePanel("Mall Customer Clustering Analysis"),
    
    sidebarLayout(
        
        sidebarPanel(
            selectInput('xcol', 'Select an X-axis variable', data_choice),
            selectInput('ycol', 'Select an Y-axis variable', data_choice, selected = data_choice[[2]]),
            sliderInput("k_clusters", "Select number of clusters", 1, 10, 
                        value = 3)
        ),
        
        mainPanel(
            plotOutput("plot1"),
            h3("Gap statistic score for selected variables and number of clusters:"), 
            h3(textOutput("gap_stats_k"))
        )
    )
)
