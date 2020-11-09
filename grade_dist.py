### report additions
#In addition to the future directions mentioned above, I was also curious about what the 
#distribution of average scores would look like separated by if a student completed a test preparation course
#if we separated scores into typical letter grade bins such as A(80-100), B(70-80), C(60-70), D(50-60), & F(<50).
#The figure below illustrates the distribution of math scores from the given students under these conditions
#CONCLUSION:

#import applicable packages
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

#read in dataframe
data = pd.read_csv("source_data/StudentsPerformance.csv")
data.head()

#compute average score among 3 tests
data['average_score'] = (data['math score']+data['reading score']+data['writing score'])/3

#assign letter grade for average score
def GetGrade(average_score):
    if (average_score >= 80):
        return 'A'
    if (average_score >= 70):
        return 'B'
    if (average_score >= 60):
        return 'C'
    if (average_score >= 50):
        return 'D'
    else: 
        return 'F'

#add dataframe column     
data['Grade'] = data.apply(lambda x : GetGrade(x['average_score']), axis = 1)
#data.Grade.value_counts()

#plot of full grade distribution
##sns.countplot(x="Grade", data = data, order=['A','B','C','D','F'],  palette="muted")
##plt.show()
##plt.savefig('figures/avg_grade_dist.png')

#letter grade distribution sorted by test prep (complete/none)
p = sns.countplot(x='test preparation course', data = data, hue='Grade', palette='bright')
q = plt.setp(p.get_xticklabels(),rotation=0)
plt.savefig('figures/testprep_grade_dist.png')
