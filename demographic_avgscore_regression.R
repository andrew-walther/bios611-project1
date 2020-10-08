library(tidyverse);

StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

#regression model with demographic factors
model_2 <- lm(avg.score ~ gender + race.ethnicity + parental.level.of.education + lunch + test.preparation.course, data=StudentsPerformance)
summary(model_2)
#make predictions with testing data on model
pr.lm <- predict(model_2, TEST)
plot(model_2, which=c(1,1))
#calculate MSE for predictions
MSE(pr.lm, StudentsPerformance$avg.score)
score_Predictions <- TEST %>% mutate(pr.lm = pr.lm)