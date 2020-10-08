library(corrplot);

#read in source data
StudentsPerformance <- 
  read_csv("source_data/StudentsPerformance.csv");

M <- cor(StudentsPerformance[,6:8]);
corrplot.mixed(M)