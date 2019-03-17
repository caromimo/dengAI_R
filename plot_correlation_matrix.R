library(tidyverse)
library(ggcorrplot)

data <- read_csv("clean_training_data.csv") %>%
  select_if(is.numeric)

# to plot the correlation matrix
correl <- cor(data, use = "all.obs", method="pearson")
p.mat <- cor_pmat(correl)
ggcorrplot(correl, title = "Correlation matrix", lab=TRUE, p.mat = p.mat, sig.level = .05)
ggsave("correlation_matrix.png", height = 21 , width = 21 , device="png")

# to extract the results
res <- cor(data)
res_df <- as.data.frame(res)
res_df <- res_df %>% rownames_to_column('variables')
res_df_tc <- res_df %>% select(variables, total_cases)
res_df_tc <- arrange(res_df_tc, total_cases)
res_df_tc
