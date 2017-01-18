data table;
	input plant $ length width height @@;
datalines;
	mark 12 6 8 abc 11 7 8 late 11 8 9
		york 6 . 5 aaa . 7 7
;
	run;
	proc print data=table;
	run;