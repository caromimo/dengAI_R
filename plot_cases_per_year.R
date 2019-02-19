library(tidyverse)

cases <- read_csv("dengue_labels_train.csv")

cases %>% ggplot() + 
  geom_boxplot(aes(year, total_cases, group=year)) + 
  facet_grid(city ~ ., scale = "free") + 
  ggtitle("Total number of cases per year in each cities")
ggsave("cases_per_year.png", device="png")