set.seed(611)
library(tidyverse);
library(MLmetrics);
library(rpart);
library(rattle);
library(rpart.plot);

#StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv")

#read in source data
StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

#creates training and testing data sets from the full student performance data set (20% test, 80% train)
test_id <- sample(1:nrow(StudentsPerformance), size=round(0.2*nrow(StudentsPerformance)));
TEST <- StudentsPerformance[test_id,];
TRAIN <- StudentsPerformance[-test_id,];

#classification tree of gender as response variable with avg.score as the explanatory variables.
tree <- rpart(avg.score~gender + lunch + test.preparation.course, data=TRAIN);
pr.tree <- predict(tree, newdata=TEST);
fancyRpartPlot(tree);
#MSE calculation
mse <- MSE(pr.tree, StudentsPerformance$avg.score);
score_Predictions <- score_Predictions %>% mutate(pr.tree = pr.tree);

#save model output
#setwd("~/bios611-project1/figures");
setwd("~/figures");
getwd();
png(filename = "decisiontree.png");
fancyRpartPlot(tree);
dev.off()