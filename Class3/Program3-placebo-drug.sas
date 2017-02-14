data clinical_trial;
	do i = 1 to 200;
		x = "placebo";
		y = rannor(23);
		output;
		
	do i = 1 to 200;
		x = "drug";
		y = 1 + rannor(23);
	output;
end;

proc ttest data=clinical_trial;

var y;
title t-test for comparing the means of y in placebo and drug groups;
run;
proc print data=clinical_trial;
run;

proc chart data=clinical_trial;
	vbar x/subgroup=y;
run;