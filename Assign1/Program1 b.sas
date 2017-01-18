data aaupcopy1;
	set aaup;
	drop univ_name type; 
run;
proc print data=aaupcopy1;
run;