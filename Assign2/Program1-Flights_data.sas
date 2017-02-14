filename faa1 '/folders/myfolders/sas_intro/Assign2/FAA1.xls';

proc import datafile=faa1
	dbms=XLS
	out=faa1;
	getnames=YES;
run;

/*
PROC CONTENTS DATA=faa1; 
run;

proc print data=faa1;
run;
*/

filename faa2 '/folders/myfolders/sas_intro/Assign2/FAA2.xls';

proc import datafile=faa2
	dbms=XLS
	out=faa2;
	getnames=YES;
run;

/*
PROC CONTENTS DATA=faa2;
run;

proc print data=faa2;
run;
*/

data faa1_l1;
	set faa1;
	if missing(aircraft) then delete;
run;
/*
proc print data=faa1_l1;
run;
*/



data faa2_l1;
	set faa2;
	if missing(aircraft) then delete;
run;


/*
proc print data=faa2_l1;
run;
*/


data combined1;
	set faa1_l1 faa2_l1;
run;

/*
proc print data=combined1;
run;
*/

data combined_l1;
	set combined1;
	/* drop duration speed_air; */
run;

proc sort data=combined_l1;
	by aircraft;
run;


/*
proc print data=combined_l1;
run;
*/
	


data combined_l2;
	set combined_l1;
	if not(missing(duration)) and duration < 40 then delete;
	if no_pasg < 0 then delete;
	if speed_ground < 30 and speed_ground > 140 then delete;
	if not(missing(speed_air)) and speed_air < 30 and speed_air > 140 then delete; 
	if height< 6 then delete; 
run;


proc sort data=combined_l2 out=combined_l3 nodupkey dupout=Duplicate;
     by aircraft no_pasg speed_ground height pitch distance;   
run;

proc means data=combined_l3 n nmiss stddev min max mean range t prt;
 	var duration no_pasg speed_ground speed_air height pitch distance;
 	Title Summary Statistics for each Variable;
run;

proc means data=combined_l3 n nmiss stddev min max mean range t prt;
 	by aircraft;
 	var duration no_pasg speed_ground speed_air height pitch distance;
 	Title Descriptive Statistics for each Variable by Aircraft;
run;

/*
proc print data=combined_l2;
title Combined Data from Dataset 1 and 2;
run; 
*/

/*
proc print data=combined_l3;
	Title Dataset after duplicates are removed;
run; 
*/

/*
proc chart data=simulation;
vbar x1 / subgroup=sign;
run;
*/

proc chart data=combined_l3;
	vbar duration no_pasg speed_ground speed_air height pitch distance;	
	Title Histograms of Variables;
run;

/*
proc univariate data=combined_l3;
	by aircraft;
	var duration no_pasg speed_ground speed_air height pitch distance;
	histogram duration / normal midpoints =0 to 320 by 25;
	histogram no_pasg / normal midpoints =30 to 90 by 4;
	histogram speed_ground / normal midpoints =30 to 135 by 8;
	histogram speed_air / normal midpoints =90 to 135 by 3;
	histogram height / normal midpoints =0 to 60 by 6;
	histogram pitch / normal midpoints =2.1 to 5.6 by 0.2;
	histogram distance / normal midpoints =40 to 5000 by 400;
	title All variables histograms;
run;
*/

proc ttest data=combined_l3;
	class aircraft;
	var distance;
	Title T-Test to compare varianc eof distance;
run;


proc plot data=combined_l3;
	plot distance * duration='D' distance * no_pasg='N' 
	distance * speed_ground ='G' distance * speed_air = 'A' 
	distance * height = 'H' distance * pitch = 'P';
	Title Plots of Distance vs Other Parameters;
run;

proc corr data=combined_l3;
	var duration speed_ground speed_air height pitch;
	with Distance;
	Title Correlation coefficients with Distance;
run;

data combined_l4;
	set combined_l3;
	if speed_air=. then speed_air1=103.83;
	else speed_air1 = speed_air;
run;


proc reg data=combined_l4;
	model distance=speed_ground speed_air1/r;
	output out=diagnostics r=residual; 
	title Regression Analysis of Flight Data Set;
run; 

proc plot data=diagnostics;
	plot residual*speed_ground;
	plot residual*speed_air1;
	title Plot of Residual vs Variables;
run;

proc chart data=diagnostics;
	vbar residual;
title Histogram of residual;
run;

proc univariate data=diagnostics normal;
var residual;
histogram residual / normal midpoints =-4 to 4 by 1;
title Check if residual follows a normal distribution;
run;

proc means data=diagnostics n nmiss mean std min max range;
var residual;
title Summary statistics for residual;
run;


	














