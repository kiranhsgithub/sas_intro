data aaupcopyal;
	set work.aaupcopy1; 
if  state = 'AL';
run;
proc print data=aaupcopyal;
run;