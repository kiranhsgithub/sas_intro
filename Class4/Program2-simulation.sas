data simulation;
do i=1 to 200;

	x1=1+2*rannor(12);x2=3+rannor(12);error=rannor(12);
	alpha=1;beta_1=2;beta_2=-1.5;
	y=alpha+beta_1*x1+beta_2*x2+error;

	if y>0 then y_bin=1;
	else y_bin=0;
	
	output;
end;
keep x1 x2 y y_bin;
run;

/*
proc print data=simulation;
title Simulated Data Set;
run; 
*/

proc means data=simulation range;
	var x1 x2;
	Title Range of X1 and X2;
run;

proc univariate data=simulation normal;
	var y;
	histogram y/ normal midpoints=-14 to 10 by 1;
	title Check if Y follows Normal Distribution;
run;


proc freq data=simulation;
	table y_bin;
	title Frequency table of y_bin;
run;

proc plot data=simulation;
plot y*x1;
plot y*x2;
plot x1*x2;
title Y versus X1, Y versus X1, X1 versus X2
run;

proc plot data=simulation;
plot y *x1='$' y*x2='*' /overlay;
title X1 as $ and X2 as * overlaid
run;

proc corr data=simulation;
var y x1 x2;
title Pairwise correlation coefficients;
run;

proc corr data=simulation;
var x1 x2;
with y;
title Correlation coefficients with Y;
run;


/*
proc reg data=simulation;
model y=x1 x2;
title Regrssion analysis of the simulated data set;
run;

proc reg data=simulation;
model y=x1 x2/r;
title Regrssion analysis of the simulated data with R;
run;
*/
proc reg data=simulation;
model y=x1 x2 / r;
output out=diagnostics r=residual;
run;

proc plot data=diagnostics;
plot residual*x1;
plot residual*x2;
plot residual*y;
title Residual versus X1 and X2;
run;

proc chart data=diagnostics;
	vbar residual;
title Histogram of residual;
run;

proc univariate data=diagnostics normal;
var residual;
histogram residual / normal midpoints =-4 to 4 by 1;
title Check if residual follows a normal distribution;
run;

proc means data=diagnostics n nmiss mean std min max range;
var residual;
title Summary statistics for residual;
run;

