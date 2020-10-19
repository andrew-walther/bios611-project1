library(tidyverse);
library(gridExtra);

#read in data
#StudentsPerformance <- read.csv("~/bios611-project1/source_data/StudentsPerformance.csv");
StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");

#add average score column
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

#histogram of average scores separated by yes/no test prep course
p <- ggplot(StudentsPerformance, aes(x=avg.score, color=test.preparation.course)) +
  geom_histogram(fill="white", alpha=0.3, position="identity") +
  labs(title = 'Histogram of average exam score by test prep course',x='Average score from three exams');

#save figure
#ggsave("~/bios611-project1/figures/averagescore_testprep.png", width = 6, height = 4, plot=p)
ggsave("figures/averagescore_testprep.png",plot=p)