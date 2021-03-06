library(tidyverse);

StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");

model_1 <- lm(math.score ~ writing.score + gender, data=StudentsPerformance);
summary(model_1);

saveRDS(model_1, "model_1.rds")