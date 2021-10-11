library(shiny)
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

# Load mall customer data
info_customer <- "mall_customers.csv"
info_customer_path <- paste0(getwd(), "/Data/", info_customer )
df_mall_cust <- read.csv(info_customer_path, header = TRUE)
# df_mall_cust <- df_mall_cust %>%
#                 mutate(Gender = ifelse(Gender=="Female", 1, 0))

# Color blind friendly color palette
cbbPalette <- c("#E69F00", "#56B4E9", "#CC79A7","#009E73", "#F0E442", "#0072B2", 
                "#D55E00","#000000","#999999", "#29BF12", "#882255")


# Define shiny server

shinyServer(function(input, output) {

    
    # User subset choice of mall customer data
    user_data_subset <- reactive({
        df_mall_cust %>%
        select(input$xcol, input$ycol)
    })
    # compute k-means
    clusters <- reactive({
        kmeans(user_data_subset (), input$k_clusters)
    })
    # compute optimum k clusters by the gap statistic method
    gap_stat <- reactive({
        as.data.frame(clusGap(user_data_subset (), FUN = kmeans, nstart = 25,
                K.max = 10, B = 50)[[1]])[input$k_clusters,3]
    })
    output$plot1 <- renderPlot({
        # Create units
        units_x <- ifelse(input$xcol == "Age", "(years)", 
                          ifelse(input$xcol == "Annual_income", "(K$)",
                                 ifelse(input$xcol == "Spending_score","(1-100)", "(-)")))
        
        units_y <- ifelse(input$ycol == "Age", "(years)", 
                          ifelse(input$ycol == "Annual_income", "(K$)",
                                 ifelse(input$ycol == "Spending_score","(1-100)", "(-)")))
        # cluster centers
        xy_centers <- as.data.frame(clusters()$centers)
        
        #actual plotting
        ggplot(user_data_subset()) +
            geom_point(aes(x = get(input$xcol), y = get(input$ycol), 
                           color = as.factor(clusters()$cluster)), size = 4) +

            geom_point(data =xy_centers,  aes(x = get(input$xcol), y = get(input$ycol)), shape=8,
                       size = 6, stroke = 2, color = "black") +
            scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
            xlab(paste(input$xcol, units_x, sep = " ")) +
            ylab(paste(input$ycol, units_y, sep = " "))  +
            scale_color_manual(values = cbbPalette) +
            labs(color='Clusters') 
            #theme(legend.position = "bottom")
    })

    
    output$gap_stats_k <- renderText({
        gap_stat()
    })
})