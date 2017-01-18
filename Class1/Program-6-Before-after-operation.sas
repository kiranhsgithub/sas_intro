data reading;
	input before after;
	diff=after-before;
cards;
20 29
12 20
19 23
16 17
;
run;
proc print;
run;