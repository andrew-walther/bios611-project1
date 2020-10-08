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
	



clean:
	rm -f derived_data/*.csv
	rm -f figures/*.png
	rm -f figures/*.pdf
	rm -f final_report.pdf
