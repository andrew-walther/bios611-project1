library(tidyverse);
library(dplyr);

#read in source data
StudentsPerformance <- 
  read_csv("source_data/StudentsPerformance.csv");

#create derived dataframes
average_scores <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2))
  
Performance_Male <- StudentsPerformance %>% filter(gender=='male')

Performance_Female <- StudentsPerformance %>% filter(gender=='female')

#save derived dataframes

write_csv(StudentsPerformance, "derived_data/StudentsPerformance.csv");
write_csv(average_scores, "derived_data/average_scores.csv");
write_csv(Performance_Male, "derived_data/Performance_Male.csv");
write_csv(Performance_Female, "derived_data/Performance_Female.csv");