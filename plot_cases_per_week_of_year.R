library(tidyverse)

cases <- read_csv("dengue_labels_train.csv")

cases %>% ggplot() + 
  geom_boxplot(aes(weekofyear, total_cases, group=weekofyear)) + 
  facet_grid(city ~ ., scale = "free") + 
  ggtitle("Total number of cases per week-of-the-year in each city") 
ggsave("cases_per_week.png", device="png")
