library(tidyverse)
library(mosaic)

StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");

Performance_Male <- StudentsPerformance %>% filter(gender=='male');

Performance_Female <- StudentsPerformance %>% filter(gender=='female');

#summmary statistics for math scores
favstats(StudentsPerformance$math.score);
favstats(Performance_Male$math.score);
favstats(Performance_Female$math.score);

#summary statistics for reading scores
favstats(StudentsPerformance$reading.score);
favstats(Performance_Male$reading.score);
favstats(Performance_Female$reading.score);

#summary statistics for writing scores
favstats(StudentsPerformance$writing.score);
favstats(Performance_Male$writing.score);
favstats(Performance_Female$writing.score)

