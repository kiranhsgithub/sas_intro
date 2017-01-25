data yr1998;
	input day $ 1-5 temp 7-8 weather $ 9-15;
cards;
Jan 1 33 sun
Jan 2 35 sun 
Jan 3 45 clouds
Jan 5 28 snow
;
run;
proc print;
run;

data yr1999;
	input day $ 1-5 temp 7-8;
cards;
Jan 1 25
Jan 2 20
Jan 3 35
Jan 6 40
jan 8 39
;
run;
proc print;
run;


data combined;
	set yr1998 yr1999;
run;
proc print;
run;


/*
proc sort data=yr1998;
	by day;
proc sort data=yr1999;
	by day;
	*/
data combined2;
	set yr1998 yr1999;
	by day;
run;
proc print;
run;

data merged;
	merge yr1998 yr1999;
run;
proc print data=merged;
run;

data mergedbyday;
	merge yr1998 yr1999;
	by day;
run;
proc print;
run;

