library(tidyverse);
library(gridExtra);

StudentsPerformance <- 
  read_csv("source_data/StudentsPerformance.csv");

#add average score column
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));

#math vs. writing by gender
p <- ggplot(StudentsPerformance) + geom_point(aes(x=writing.score,y=math.score,color=gender)) + 
  labs(title = 'Math score vs. writing score', x='Writing Score', y='Math Score');

ggsave("figures/math_writing_gender.png",plot=p)