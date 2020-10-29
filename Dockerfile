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
RUN R -e "install.packages('gridExtra')"
RUN R -e "install.packages('corrplot')"
RUN R -e "install.packages('shiny')"
RUN R -e "install.packages('plotly')"
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install numpy pandas sklearn plotnine matplotlib pandasql bokeh