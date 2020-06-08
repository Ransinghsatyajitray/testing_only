# Data UnderStanding----

source("00_Data/Raw_data_import.R")

#Checking the Number of Instances the of New Code Sale,

library(DataExplorer)
library(ggplot2)
library(skimr)
library(PerformanceAnalytics)



#1. Understanding the Structure of the data----
str(Price_hist)
summary(Price_hist)
skim(Price_hist)


Mean_SKU_Sales_Tbl <- Price_hist %>% group_by(Material) %>% 
  summarise(Qty_Mean=round(mean(Qty)),NDP_Mean=mean(NDP),NDP_Total=sum(NDP),OldCd_Mean=round(mean(`Old_Code_Sale`)),
            Skewness_Qty=skewness(Qty),Skewness_OldCd=skewness(`Old Code`),  
            Min_Qty=min(Qty),Max_Qty=max(Qty),Total_Qty=sum(Qty), Total_Old_Cd=sum(Old_Code_Sale)
            Min_OldCd=min(`Old_Code_Sale`),Max_OldCd=max(`Old_Code_Sale`))


#Inference : Skewness should lie between -0.5 and 0.5. Values greater than 0 signifies long tail towards the right of the distribution and lesser tha 0 shows long tail towards the left
#Outliers and Exceptional Observation




#1.1 Top 30 SKU: Total NDP, Mean_Qty, Total_Old_Code











#2. Understanding the total sale (All inclusive) trend across the months. (Graph)----






#3. Understanding the Cummulative sale across the month.(Graph)----

#4. Understanding if there is correlation between monthly sale of multiple products independently ----

#5. Anova Analysis between total sale of Tyres (Qty) and Month./ Box Plot ----

#6. Policy Discount Total and Special Discount trend across the Month and ANOVA./Box Plot ----

#7. Identifying the monthwise pattern of Old Code Sale Qty.----

#8. Correlation analysis Overall Qty, Qty_less_Old_Cd, Policy Discount Total and Special Discount ----
#   Data Frame How Each SKU NDP, Qty, Qty_less_Old_Cd, Policy Discount Total and Special Discount are correlated with each other.
#9. Determine the Skewness in the Qty data. ----

#10.Create Lag variable, Percentage rise in NDP and Percentage decrease in Sales and determine in when the price in terms of NDP/Qty_less_Old_Code become less and
#11.Per SKU Price/(NDP-Discounts) to Quantity demanded per month. <Depending on the slope , the demand curve can be elastic or inelastic> ----

#   Its is possible that some SKUs are Inelastic. (Change in price leads to smaller percentage change in demand) ----
#12.See possibility of making this a shiny App. ----

#13.Conduct LVQ to determine the importance of the variables overall ----
#14.The associations between categorical variables are computed using the Cramer’ V metric. ----

#15.There are two lines to help you to see any relationship between variables: the simple regression model line (linear model, lm) in red, and the Locally Weighted Scatterplot Smoothing (LOWESS) 
#   line in blue. While the former is a parametric way to fit the curve (you assume in advance the data fits some type of distribution), the latter is a non-parametric strategy that tries to find a curve of best fit without assuming the data must fit some distribution shape.



