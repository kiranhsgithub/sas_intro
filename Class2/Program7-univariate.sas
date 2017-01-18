data football;
	input team $ score @@;
cards;
Cincinnati 18 UOhio 27 UOhio 39
Cincinnati 16 Cincinnati 29 UOhio 42
;
run;
proc sort data=football;
	by team;
run;
proc univariate data=football;
	by team;
	var score;
run;