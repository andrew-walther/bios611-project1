library(tidyverse);

StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

#classification tree of gender as response variable with avg.score as the explanatory variables.
tree <- rpart(avg.score~gender + lunch + test.preparation.course, data=TRAIN)
pr.tree <- predict(tree, newdata=TEST)
fancyRpartPlot(tree)
MSE(pr.tree, StudentsPerformance$avg.score)
score_Predictions <- score_Predictions %>% mutate(pr.tree = pr.tree)