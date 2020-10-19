library(corrplot);
library(tidyverse);

#StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv")

#read in source data
StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");

M <- cor(StudentsPerformance[,6:8]);
p <- corrplot.mixed(M);

#ggsave("~bios611-project1/figures/correlation.png",plot=p)
#setwd("~/bios611-project1/figures");
setwd("~/figures");
getwd();
png(filename = "correlation.png");
corrplot.mixed(M);
dev.off()