Mall customer clustering analysis
========================================================
author: David Taylor
date: 10/8/2021
autosize: true

Objective for this Assignment
========================================================
- To create a Shiny application including user input and display a reactive output deployed on RStudio's servers.&nbsp;
A reproducible presentation should also be provided to pitch the shiny application and prepared in RStudio Presenter

- The Shiny application and presentation code are available on the github repository: https://github.com/dvtaylora/Dev_Data_Product_W4/
- The Shiny application can be accessed at https://dvtaylor.shinyapps.io/
- Finally the RStudio Presenter presentation is available at;

Data set explored in this project
========================================================
- The Mall Customer Segmentation Data is used and can be found [here](https://www.kaggle.com/vjchoudhary7/customer-segmentation-tutorial-in-python) 

- The data consists in basic customer information such as ID, age, gender, income (K$), spending score (1-100) based on spending behavior. The first table below shows the first 6 rows of the data set and the second is a summary of the data set


```
  Customer_ID Gender Age Annual_income Spending_score
1           1   Male  19            15             39
2           2   Male  21            15             81
3           3 Female  20            16              6
4           4 Female  23            16             77
5           5 Female  31            17             40
6           6 Female  22            17             76
```

```
  Customer_ID        Gender               Age        Annual_income   
 Min.   :  1.00   Length:200         Min.   :18.00   Min.   : 15.00  
 1st Qu.: 50.75   Class :character   1st Qu.:28.75   1st Qu.: 41.50  
 Median :100.50   Mode  :character   Median :36.00   Median : 61.50  
 Mean   :100.50                      Mean   :38.85   Mean   : 60.56  
 3rd Qu.:150.25                      3rd Qu.:49.00   3rd Qu.: 78.00  
 Max.   :200.00                      Max.   :70.00   Max.   :137.00  
 Spending_score 
 Min.   : 1.00  
 1st Qu.:34.75  
 Median :50.00  
 Mean   :50.20  
 3rd Qu.:73.00  
 Max.   :99.00  
```
Mall Customer Segmentation Data clustering exploration
========================================================
- The goal of this project is to allow the users to explore clustering of the Mall Customer Segmentation Data through a Shiny application 
- The users can select the x-axis and y-axis variable for clustering from drop down menus and the number of clusters with a slider.
- The application will compute the clustering based on the 3 user inputs, will color the data points belonging to each cluster and will place an asteriks ate the center of each cluster.
- The application will also return a score  (higher is better) for selected variables and number of clusters based on the gap statistic method (see method details [here](http://www.web.stanford.edu/~hastie/Papers/gap.pdf) )

Shiny application screenshot
========================================================

![pic](mall_cust_clust_analy.JPG)

<div class="footer" style="margin-top:-0px;font-size:80%;">
Screenshot of Shiny app Mall Customer Clustering Analysis.<br>
The user can select 3 parameters in the sidebar panel, the x-axis and y-axis variables for clustering from drop down menus and select the number of clusters with a slider.<br> 
The application will compute the clustering based on the 3 user inputs, will display the selected data and color the data points belonging to each cluster and will place an asteriks at the center of each cluster.&nbsp; Additionally, the application will compute a clustering score (higher is better) for selected variables and number of clusters based on the gap statistic method.</div>
