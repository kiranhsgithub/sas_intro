data squareroot;
	input number @@;
	if number>=0 then squareroot = sqrt(number);
	else squareroot = .;
cards;
	4 0 -9 32 -13 -98 100
;
run;
proc print;
run;
	