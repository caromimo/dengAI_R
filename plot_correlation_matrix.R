library(tidyverse)
library(ggcorrplot)

data <- read_csv("clean_training_data.csv") %>%
  select_if(is.numeric)

correl <- cor(data, use = "all.obs", method="pearson")
ggcorrplot(correl)
ggsave("correlation_matrix.png", device="png")