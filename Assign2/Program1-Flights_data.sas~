FILENAME faa1 '/folders/myfolders/sas_intro/Assign2/FAA1.xls';

PROC IMPORT DATAFILE=faa1
	DBMS=XLS
	OUT=faa1;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=faa1; RUN;

run;
proc print data=faa1;
run;


FILENAME faa2 '/folders/myfolders/sas_intro/Assign2/FAA2.xls';

PROC IMPORT DATAFILE=faa2
	DBMS=XLS
	OUT=faa2;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=faa2; RUN;


run;
proc print data=faa2;
run;


data faa1_l1;
	set faa1;
	if missing(aircraft) then delete;
run;
proc print data=faa1_l1;
run;



data faa2_l1;
	set faa2;
	if missing(aircraft) then delete;
run;
proc print data=faa2_l1;
run;



data combined1;
	set faa1_l1 faa2_l1;
run;
proc print data=combined1;
run;

data combined_l1;
	set combined1;
	drop duration speed_air;
run;
proc print data=combined_l1;
run;

data combined_l2;
	set combined_l1;
	if height<0 then delete;
run;

proc print data=combined_l2;
run; 

proc sort data=combined_l2 out=combined_l3 nodupkey dupout=Duplicate;
     by aircraft no_pasg speed_ground height pitch distance;   
run;
proc print data=combined_l3;
run; 

run;
proc univariate data=combined_l3;
run;
