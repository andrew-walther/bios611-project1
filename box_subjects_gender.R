library(tidyverse);
library(gridExtra);

#StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv");

StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");

#math scores by gender
math_gender <- ggplot(StudentsPerformance, aes(math.score,color=gender)) + geom_boxplot() + xlab("Math Score") + ggtitle("Math Scores by Gender");

#reading scores by gender
reading_gender <- ggplot(StudentsPerformance, aes(reading.score,color=gender)) + geom_boxplot() + xlab("Reading Score") + ggtitle("Reading Scores by Gender");

#writing scores by gender
writing_gender <- ggplot(StudentsPerformance, aes(writing.score,color=gender)) + geom_boxplot() + xlab("Writing Score") + ggtitle("Writing Scores by Gender");

#arrange plots into single image
grid.arrange(math_gender,reading_gender,writing_gender, ncol=1, nrow=3);

#save image to file  
p <- arrangeGrob(math_gender,reading_gender,writing_gender, ncol=1, nrow=3);
#ggsave("~bios611-project1/figures/subjects_gender_box.png",plot=p)
#setwd("~/bios611-project1/figures");
setwd("~/figures");
getwd();
png(filename = "subjects_gender_box.png");
plot(p);
dev.off()