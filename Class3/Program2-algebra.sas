data simulation;
	do i = 1 to 200;
	x1 = 2*rannor(12) + 1;
	x2 = rannor(12) + 3;
	error = rannor(12);
	y = 1 + 2 * x1 - 1.5 * x2 + error;
	if y>0 then y_bin=1; 
	else y_bin=0;
	
	if y>0 then sign = "positive";
	else sign = "negative";
	output;
end;
run;
proc print data=simulation;
title Simulated Dataset;
run;

proc means data=simulation range;
	var x1 x2;
	title The Range of x1 and x2;
	
proc sort data=simulation;
by sign;
run;	
	
proc means data=simulation n mean median std min max;
	by sign;
	var x1;
	title Range of x1 and sign;
	
proc chart data=simulation;
	vbar x1;
run;

proc chart data=simulation;
	hbar x1;
run;

proc chart data=simulation;
	vbar x1/ subgroup=y_bin;
run;














 	