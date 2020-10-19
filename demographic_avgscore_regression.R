set.seed(611)
library(tidyverse);
library(MLmetrics);

#StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv")

#read in source data
StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));


#creates training and testing data sets from the full student performance data set (20% test, 80% train)
test_id <- sample(1:nrow(StudentsPerformance), size=round(0.2*nrow(StudentsPerformance)));
TEST <- StudentsPerformance[test_id,];
TRAIN <- StudentsPerformance[-test_id,];


#regression model with demographic factors
model_2 <- lm(avg.score ~ gender + race.ethnicity + parental.level.of.education + lunch + test.preparation.course, data=StudentsPerformance);
summary(model_2);
#make predictions with testing data on model
pr.lm <- predict(model_2, TEST);
p <- plot(model_2, which=c(1,1));
#calculate MSE for predictions
mse <- MSE(pr.lm, StudentsPerformance$avg.score);
score_Predictions <- TEST %>% mutate(pr.lm = pr.lm);

#save model output
#setwd("~/bios611-project1/figures");
setwd("~/figures");
getwd();
png(filename = "regression_residualplot.png");
plot(model_2, which=c(1,1));
dev.off()