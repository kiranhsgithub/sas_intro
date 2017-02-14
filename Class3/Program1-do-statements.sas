data one;
	do i = 1 to 10;
	x= rannor(12);
	output;
	
	end;
run;
proc print data=one;
run;