FROM rocker/verse
MAINTAINER Andrew Walther <awalther@unc.edu>
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('mosaic')"
RUN R -e "install.packages('rpart')"
RUN R -e "install.packages('rattle')"
RUN R -e "install.packages('rpart.plot')"
RUN R -e "install.packages('RColorBrewer')"
RUN R -e "install.packages('caret')"
RUN R -e "install.packages('MLmetrics')"
