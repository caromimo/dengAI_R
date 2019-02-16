# execute code in the same folder as training.csv dataset is located

# clear workspace memory
remove(list=ls())

# import libraries
library(tidyverse)
library(mice)

merged_training_data <- read_csv("merged_training_data.csv")

# identifying missing values
sum(is.na(merged_training_data))/prod(dim(merged_training_data))
missing <- apply(merged_training_data, 2, function(col)sum(is.na(col))/length(col))*100
missing

# visualise missing values
md.pattern(merged_training_data)

# impute missing data with method pmm from mice
tempData <- mice(merged_training_data,m=5,maxit=50,meth='pmm',seed=500)

# visualize the imputed data
xyplot(tempData,ndvi_ne ~ ndvi_nw+ndvi_se+ndvi_sw,pch=18,cex=1)

# complete missing data
imputed_training_data <- complete(tempData,1)

# visualize missing values
md.pattern(imputed_training_data)

# visualize missing values
md.pattern(imputed_training_data)

# removing the 13 rows with remaining missing values (assumed to be negligible 13/1456 observations)
imputed_training_data %>% 
  filter(is.na(reanalysis_sat_precip_amt_mm) == FALSE) %>%
  write_csv("clean_training_data.csv")


