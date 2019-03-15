# execute code in the same folder as datasets downloaded from:
# https://www.drivendata.org/competitions/44/dengai-predicting-disease-spread/

# clear workspace memory
remove(list = ls())

# import libraries
library(tidyverse)

cases <- read_csv("dengue_labels_train.csv")
parameters <- read_csv("dengue_features_train.csv")

# merge the cases and parameters file
merged_training_data <- merge(cases, parameters, by = c("city", "year", "weekofyear"))

# save data as csv file
write_csv(merged_training_data, path = "merged_training_data.csv")
