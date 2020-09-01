Project 1 BIOS 611
==================
Test Score Dataset
------------------

Proposal
--------

### Introduction

Through the formative years of every young student's life, they are often inundated by the task of taking exams to assess knowledge in a variety of subject matter areas. Although few students find taking exams to be an enjoyable tasks, the results are often indicative of one's aptitude for learning. On the outside of every exam experience, a multitude of outside factors can influence student performance aside from the raw education received in the classroom.

Does gender play a significant role in exam performance among different subject areas? Can we predict if a student will perform better on an exam due to their cultural background, the education level of their parents, or wheter or not they took a test prep course prior to taking exams?

In this project, we'll investigate the connections between these factors and the resulting test scores from a publicly avaiable dataset. This analysis will be completed with linear regression modeling and other machine learning techniques that will help to predict a student's test outcome based on their personal background.

### Dataset

The dataset we will analyze is publicly available on Kaggle and it covers student test score performance metrics for mathematics, reading, and writing tests. The dataset can be downloaded from [](https://www.kaggle.com/spscientist/students-performance-in-exams).

This Repo will later contain a complete analysis of the aforementioned exam performance dataset.

### Preliminary Figures & Exploratory Data Analysis

Preliminary figures and EDA will be placed in this section.


Usage.
------

You'll need Docker and the ability to run Docker as your current user.

You'll need to build the container:

    > docker build . -t project1-env

This Docker container is based on rocker/verse. To run rstudio server:

    > docker run -v "`pwd`:/home/rstudio" -p 8787:8787\
    -e PASSWORD=mypassword -t project1-env

Then, connect to the machine on port 8787.

After that, you can view/edit the project in RStudio!

Makefile
========

The Makefile is an excellent place to look to get a feel for the project.

To build figures relating to the student test scores for example, enter Bash either via the above incantation or
with Rstudio and say:

