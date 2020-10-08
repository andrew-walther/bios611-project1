library(tidyverse);

#read in source data
StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

#creates training and testing data sets from the full student performance data set (20% test, 80% train)
test_id <- sample(1:nrow(StudentsPerformance), size=round(0.2*nrow(StudentsPerformance)));
TEST <- StudentsPerformance[test_id,];
TRAIN <- StudentsPerformance[-test_id,]