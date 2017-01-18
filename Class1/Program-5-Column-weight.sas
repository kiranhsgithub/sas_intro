data coldata;
	input name $ 1-12 age 14-15 weight 17-19 gender $ 20-20;
cards;
John Adams   18 150m
Sally Busch  20 120f
Sarah Lee    21 110f
David Turner 17 190m
;
run;
proc print;
run;