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
	if missing(aircraft) 
		and missing(distance) and missing(duration) 
		and missing(height) and missing(no_pasg) and missing(pitch) 
		and missing(speed_air) and missing(speed_ground) then delete;
run;
proc print data=faa1_l1;
run;



data faa2_l1;
	set faa2;
	if missing(aircraft) 
		and missing(distance) and missing(height) 
		and missing(no_pasg) and missing(pitch) 
		and missing(speed_air) and missing(speed_ground) then delete;
run;
proc print data=faa2_l1;
run;


data combined1;
	set faa1_l1 faa2_l1;
	title Combined Data Sets;
run;
proc print data=combined1;
run;


data combined_l2;
	set combined1;
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

proc means data=combined_l3 n nmiss mean stddev min max;
by aircraft;
title Summary;
run;
/*
data missing_duration;
set combined_l3;
array aircrafts(*)  aircraft;
array distances(*) distance;
array durations(*) duration;
array heights(*) height;
array No_pasgs(*) no_pasg;
array pitchs(*)  pitch;
array speed_airs(*)  speed_air;
array speed_grounds(*) speed_ground;
missing_aircraft_count=0;
missing_distance_count=0;
missing_duration_count=0;
missing_height_count=0;
missing_no_pasg_count=0;
missing_pitch_count=0;
missing_speed_air_count=0;
missing_speed_ground_count=0;
do i=1 to dim(aircrafts);
if missing(aircrafts(i))=0 then missing_aircraft_count=missing_aircraft_count+1;
end;
do i=1 to dim(distances);
if missing(distances(i))=0 then missing_distance_count=missing_distance_count+1;
end;
do i=1 to dim(heights);
if missing(heights(i))=0 then missing_height_count=missing_height_count+1;
end;
do i=1 to dim(durations);
if missing(durations(i))=0 then missing_duration_count=missing_duration_count+1;
end;
do i=1 to dim(no_pasgs);
if missing(no_pasgs(i))=0 then missing_no_pasg_count=missing_no_pasg_count+1;
end;
do i=1 to dim(pitchs);
if missing(pitchs(i))=0 then missing_pitch_count=missing_pitch_count+1;
end;
do i=1 to dim(speed_airs);
if missing(speed_airs(i))=0 then missing_speed_air_count=missing_speed_air_count+1;
end;
do i=1 to dim(speed_grounds);
if missing(speed_grounds(i))=0 then missing_speed_ground_count=missing_speed_ground_count+1;
end;
run;
proc print data=missing_duration;
run; 	
*/