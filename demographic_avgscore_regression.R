library(tidyverse);

StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

model_2 <- lm(avg.score ~ gender + race.ethnicity + parental.level.of.education + lunch + test.preparation.course, data=StudentsPerformance)
summary(model_2)