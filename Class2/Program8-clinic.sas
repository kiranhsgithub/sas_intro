data clinic;
	input type $ score @@;
label type=drug or placebo;
label score=health score;
datalines;
drug 8 drug 10 placebo 5 drug 9 drug 9 placebo 7 placebo 6 placebo 6
;
run;
proc sort data=clinic;
	by type;
run;
proc print data=clinic;
run;
proc means data=clinic n mean std range;
by type;
var score;
run;