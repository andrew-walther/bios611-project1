#figures in README file
figures/avgscore_testprep.png:
	source_data/StudentsPerformance.csv \
figures/hist_avgscore_gender.png:
	source_data/StudentsPerformance.csv \
figures/math_writing_gender.png:
	source_data/StudentsPerformance.csv \

.PHONY: clean
SHELL: /bin/bash

#Build the final report
final_report_update.pdf:\
 final_report_update.Rmd\
 figures/subjects_gender_box.png\
 figures/boxplot_testprep.png\
 figures/correlation.png\
 figures/regression_residualplot.png\
 figures/decisiontree.png\
	Rscript -e "rmarkdown::render('final_report_update.Rmd',output_format='pdf_document')"
	
#clean repository of artifacts
clean:
	rm -f derived_data/*.csv
	rm -f derived_data/*.json
	rm -f figures/*.png
	rm -f figures/*.pdf
	rm -f fragments/*.tex
	rm -f final_report_update.pdf
	
#Targets/dependencies/recipes
figures/subjects_gender_box.png:
 source_data/StudentsPerformance.csv\
 box_subjects_gender.R
	Rscript box_subjects_gender.R

figures/boxplot_testprep.png:
 source_data/StudentsPerformance.csv\
 boxplot_testprep.R
	Rscript boxplot_testprep.R

figures/correlation.png:
 source_data/StudentsPerformance.csv\
 correlation.png
	Rscript correlation.png

figures/regression_residualplot.png:
 source_data/StudentsPerformance.csv\
 demographic_avgscore_regression.R
	Rscript demographic_avgscore_regression.R
	
figures/decisiontree.png:
 source_data/StudentsPerformance.csv\
 demographic_treemodel.R
	Rscript demographic_treemodel.R
	
model_1.rds:
 source_data/StudentsPerformance.csv\
 math_gender_regression.R
	Rscript math_gender_regression.R
	
figures/averagescore_testprep.png:
 source_data/StudentsPerformance.csv\
 averagescore_testprep.R
	Rscript averagescore_testprep.R
	
figures/hist_avgscore_gender.png:
 source_data/StudentsPerformance.csv\
 hist_avgscore_gender.R
	Rscript hist_avgscore_gender.R
	
figures/math_writing_gender.png:
 source_data/StudentsPerformance.csv\
 math_writing_gender.R
	Rscript math_writing_gender.R
	
derived_data/StudentsPerformance.csv\
 derived_data/average_scores.csv\
 derived_data/Performance_Male.csv\
 derived_data/Performance_Female.csv:\
 source_data/StudentsPerformance.csv\
 tidy_data.R
	Rscript tidy_data.R