data car;
	input make $ country $ mpg;
cards;
	Honda Japan 30
	Buick USA 25
	Ford USA 28
	Toyota Japan 32
	Nissan Japan 28
;
run;
proc sort data=car out=carsorted;
	by descending mpg country;
run;
proc print data=carsorted;
run;