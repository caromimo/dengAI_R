library(mice)

clean_data <- function(dataset){
  complete(mice(dataset,m=5,maxit=50,meth='pmm',seed=500),1) %>%
    filter(is.na(reanalysis_sat_precip_amt_mm) == FALSE)
}
