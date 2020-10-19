figures/avgscore_testprep.png:
	source_data/StudentsPerformance.csv \
figures/hist_avgscore_gender.png:
	source_data/StudentsPerformance.csv \
figures/math_writing_gender.png:
	source_data/StudentsPerformance.csv \

.PHONY: clean
SHELL: /bin/bash

final_report.pdf:\
 final_report.Rmd\
	Rscript -e "rmarkdown::render('final_report.Rmd',output_format='pdf_document')"
	



clean:
	rm -f derived_data/*.csv
	rm -f figures/*.png
	rm -f figures/*.pdf
	rm -f final_report.pdf

tidy_data.R:
	source_data/StudentsPerformance.csv

derived_data/StudentsPerformance.csv:
	source_data/StudentsPerformance.csv

correlation.R:
	derived_data/StudentsPerformance.csv

demographic_avgscore_regression.R:
	derived_data/StudentsPerformance.csv

demographic_treemodel.R:
	source_data/StudentsPerformance.csv

math_gender_regression.R:
	derived_data/StudentsPerformance.csv

summary_stats.R:
	derived_data/StudentsPerformance.csv

figures/subjects_gender_box.png:
	source_data/StudentsPerformance.csv

figures/subjects_testprep_box.png:
	source_data/StudentsPerformance.csv

test_train_balanced_split.R:
	source_data/StudentsPerformance.csv

mse_model_summary.R
	source_data/StudentsPerformance.csv\
	demographic_avgscore_regression.R\
	demographic_treemodel.R

box_subjects_gender.R:
	source_data/StudentsPerformance.csv

boxplot_testprep.R:
	source_data/StudentsPerformance.csv	
