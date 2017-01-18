data aaupcopyak;
	set work.aaupcopy1; 
if  state = 'AK';
run;
proc print data=aaupcopyak;
run;