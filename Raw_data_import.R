# Importing Data from Pricing_Historical and Old_Code
library(readxl)
library(dplyr)
library(tidyr)
library(sqldf)
library(lubridate)


Price_hist <- read_excel("00_Data/Pricing Historical.xlsx") %>% 
  mutate_at(vars(c("Old Code","Policy Discount -Total","Special Discount")),~replace(.,is.na(.),0)) %>% 
  mutate_at(vars("Customer"),as.factor) %>% mutate_if(is.character,as.factor) %>% na.omit() %>% 
  mutate(Indicator=paste(Material,Customer,CALMONTH,sep="-")) %>% 
  mutate(Month_in_tm = parse_date_time(CALMONTH,orders ="bY"))



Old_Code_Data <- read_excel("00_Data/Old Code Sales.xlsx") %>% 
  pivot_longer(cols=c(-Material,-Customer),names_to="CALMONTH",values_to = "Old_Code_Sale") %>% 
  mutate_at(vars("Customer"),as.factor) %>% mutate_if(is.character,as.factor) %>% 
  mutate(Indicator=paste(Material,Customer,CALMONTH,sep="-"))


Price_hist <- sqldf("SELECT * 
                     FROM Price_hist
                     LEFT JOIN Old_Code_Data
                     on Price_hist.Indicator=Old_Code_Data.Indicator")

Price_hist <- Price_hist[,!duplicated(colnames(Price_hist))]


#There are fields where Qty is 0 but NDP is present
#There are fields where Qty is neagtive
#There are fields where Old Code sale is negative
#There are cases where Old code sales > Qty


Price_hist <- Price_hist %>% mutate_at(vars(Old_Code_Sale),replace_na,0)

Price_hist <- Price_hist %>% mutate(Price_less_Old_Cd=Qty-Old_Code_Sale)
              


