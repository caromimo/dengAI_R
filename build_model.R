library(tidyverse)
library(randomForest)

cases <- read_csv("dengue_labels_train.csv")
parameters <- read_csv("dengue_features_train.csv")
test <- read_csv("dengue_features_test.csv")
sub <- read_csv("dengue_submission_format.csv")

training <- merge(cases, parameters, by = c("city", "year", "weekofyear"))

set.seed(100)

train <- training %>%
 select(city,
        year,
        weekofyear,
        total_cases,
        week_start_date,
        station_avg_temp_c,
        station_diur_temp_rng_c,
        station_max_temp_c,
        station_min_temp_c,
        station_precip_mm) %>%
 na.omit() %>%
 mutate_if(is.character, as.factor)

sum(is.na(train))

model1 <- randomForest(total_cases ~ ., data = train, importance = TRUE)
model1
importance(model1)
varImpPlot(model1)

model2 <- randomForest(total_cases ~ ., data = train, ntree = 500, mtry = 6, importance = TRUE)
model2
importance(model2)
varImpPlot(model2)

saveRDS(model2, "prediction_model.rds")
