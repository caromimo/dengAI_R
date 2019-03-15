library(tidyverse)
library(randomForest)
source("clean_data.R")

test <- read_csv("dengue_features_test.csv") %>% 
 select(city,
        year,
        weekofyear,
        week_start_date,
        station_avg_temp_c,
        station_diur_temp_rng_c,
        station_max_temp_c,
        station_min_temp_c,
        station_precip_mm) %>% 
 na.omit() %>%
 mutate_if(is.character, as.factor)

str(test)

#TODO: rationale for column selection
#TODO: use clean_data on train and test

model <- readRDS("prediction_model.rds")

print("and the predictions are")
#predict(model, test)
predictions <- predict(model, test, type="response", norm.votes=TRUE, predict.all=FALSE, proximity=FALSE, nodes=FALSE)
#predictions <- as.data.frame(predictions)
#class(predictions)
#predictions
test %>% add_column(total_cases=predictions) %>% select(city, year, weekofyear, total_cases) %>% write_csv("yipee.csv")


