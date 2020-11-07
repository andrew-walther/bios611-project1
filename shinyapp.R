#Andrew Walther
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

args <- commandArgs(trailingOnly=T);
port <- as.numeric(args[[1]]);

#StudentsPerformance <- read.csv("~/OneDrive - University of North Carolina at Chapel Hill/UNC - Fall 2020/BIOS 611 - Toups/Project 1/StudentsPerformance.csv");
StudentsPerformance <- read_csv("source_data/StudentsPerformance.csv");
StudentsPerformance <- StudentsPerformance %>% mutate(avg.score = round(rowMeans(StudentsPerformance[,6:8]),2));
#StudentsPerformance <- read_csv("derived_data/average_scores.csv")

##################################################################
#layout

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Student Test Performance"),
   
   #**Sidebar** with a slider input for number of bins 
   sidebarLayout(position='right',
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 2,
                     max = 15,
                     value = 8),
         
         selectInput("col", 
                     label = "Plot color:",
                     choices = list("red", 
                                    "green",
                                    "blue", 
                                    "orange"),
                     selected = "blue"),
         
         selectInput("data", 
                     label = "Subgroup of scores:",
                     choices = list("math score",
                                    "reading score",
                                    "writing score",
                                    "average score"),
                     selected = "average score")
      ),
      
      #**Main panel** Show a plot of the generated distribution
      mainPanel(h2("Boxplot of Test Scores by gender"),
                p("From students test performance data"),
         plotOutput("distPlot"),
         h2("Boxplot of Test Scores by completion of test prep course"),
         p("From students test performance data"),
         plotOutput("distPlot1"),
         h2("Histogram plot of all student scores by subject"),
         p("From students test performance data"),
         plotOutput("distPlot2")
      )
   )
)

##################################################################
#inputs/outputs

# Define server logic required to draw a histogram
server <- function(input, output) {
   #Plot 1
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      # change this to the mpg variable from mtcars
     x <- switch(input$data, 
                 "math score" = StudentsPerformance$math.score,
                 "reading score" = StudentsPerformance$reading.score,
                 "writing score" = StudentsPerformance$writing.score,
                 "average score" = StudentsPerformance$avg.score)
      #bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      #draw (plot 1) the histogram with the specified number of bins
         #hist(x, breaks = bins, col = input$col, border = 'black',xlab='Score', main='')
      boxplot(x~gender,data=StudentsPerformance, col = input$col, main="", 
              xlab="Gender", ylab="Test Score")
   })
   
   #Plot 2
   output$distPlot1 <- renderPlot({
     # generate bins based on input$bins from ui.R
     # change this to the mpg variable from mtcars
      x <- switch(input$data, 
                  "math score" = StudentsPerformance$math.score,
                  "reading score" = StudentsPerformance$reading.score,
                  "writing score" = StudentsPerformance$writing.score,
                  "average score" = StudentsPerformance$avg.score)
     #bins <- seq(min(x), max(x), length.out = input$bins + 1)
     
     #draw (plot 1) the histogram with the specified number of bins
         #hist(x, breaks = bins, col = input$col, border = 'black',xlab='Score', main='')
     boxplot(x~test.preparation.course, data=StudentsPerformance, col = input$col, main="", 
             xlab="Test Preparation Course", ylab="Test Score")
   })


   #Plot 3
   output$distPlot2 <- renderPlot({
      # generate bins based on input$bins from ui.R
      # change this to the mpg variable from mtcars
      x <- switch(input$data, 
                  "math score" = StudentsPerformance$math.score,
                  "reading score" = StudentsPerformance$reading.score,
                  "writing score" = StudentsPerformance$writing.score,
                  "average score" = StudentsPerformance$avg.score)
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
   
      #draw (plot 1) the histogram with the specified number of bins
         hist(x, breaks = bins, col = input$col, border = 'black',xlab='Score', main='')
         #boxplot(x~gender,data=StudentsPerformance, col = input$col, main="", xlab="Gender", ylab="Test Score")
   })
   
}
##################################################################

# Run the application 
print(sprintf("Starting shiny on port %d", port));
shinyApp(ui = ui, server = server, options = list(port = 8788, host = "0.0.0.0"))