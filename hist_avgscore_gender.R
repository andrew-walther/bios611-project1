library(tidyverse);
library(gridExtra);

StudentsPerformance <- 
  read_csv("source_data/StudentsPerformance.csv");

#add average score column
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

#distribution of average scores by gender
p <- ggplot(StudentsPerformance, aes(x=avg.score, color=gender)) +
  geom_histogram(fill="white", alpha=0.3, position="identity") +
  labs(title = 'Histogram of average exam score by gender',x='Average score from three exams');

ggsave("figures/hist_avgscore_gender.png",plot=p)