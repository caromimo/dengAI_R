# execute code in the same folder as datasets downloaded from:
# https://www.drivendata.org/competitions/44/dengai-predicting-disease-spread/

library(tidyverse)

cases <- read_csv("dengue_labels_train.csv")
parameters <- read_csv("dengue_features_train.csv")

# merge the cases and parameters file
training <- merge(cases,parameters,by=c("city","year","weekofyear"))

# save data as csv file
write_csv(training, path = "training.csv")