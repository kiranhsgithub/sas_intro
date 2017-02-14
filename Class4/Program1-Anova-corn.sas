data corn;
	input x $ y @@;
	label x=type y=yield;
cards;
a 6 b 4 c 7 a 5 b 5 c 5
a 5 b 4 c 6 a 6 b 6 c 7
;
run;
proc sort data=corn;
by x;
run;
proc print data=corn;
run;
proc anova data=corn;
	class x;
	model y=x;
	means x;
title Anova of Corn;
run;