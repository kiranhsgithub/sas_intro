data squareroot;
	input number @@;
	squared = sqrt(number);
cards;
	4 0 -9 32 -13 -98 100
;
run;
proc print;
run;
	