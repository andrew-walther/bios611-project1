library(tidyverse);
library(MLmetrics);

#read in source data
StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

score_Predictions %>% summarize(MSE.lm=MSE(pr.lm, StudentsPerformance$avg.score), MSE.tree=MSE(pr.tree, StudentsPerformance$avg.score))