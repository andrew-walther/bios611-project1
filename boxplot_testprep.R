library(tidyverse);
library(gridExtra);

StudentsPerformance <- 
  read_csv("source_data/StudentsPerformance.csv");

#math scores by test prep
math_prep <- ggplot(StudentsPerformance, aes(math.score,color=test.preparation.course)) + geom_boxplot() + xlab("Math Score") + ggtitle("Math Scores by Test Prep");

#reading scores by test prep
reading_prep <- ggplot(StudentsPerformance, aes(reading.score,color=test.preparation.course)) + geom_boxplot() + xlab("Reading Score") + ggtitle("Reading Scores by Test Prep");

#writing scores by test prep
writing_prep <- ggplot(StudentsPerformance, aes(writing.score,color=test.preparation.course)) + geom_boxplot() + xlab("Writing Score") + ggtitle("Writing Scores by Test Prep");

grid.arrange(math_prep,reading_prep,writing_prep, ncol=1, nrow=3);
ggsave("figures/subjects_testprep_box.png",plot=p)