library(corrplot);

M <- cor(StudentsPerformance[,6:8]);
corrplot.mixed(M)