data scorecopy;
	set score;
/* drop math sport music; */
keep name;
run;
proc print data=scorecopy;
run;