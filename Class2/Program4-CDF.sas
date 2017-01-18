data cdf;
	input X @@;
	cdf = probnorm(X);
datalines;
	-1 0 1 1.5 2 4
;
run;
proc print;
run;