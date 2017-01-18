data summary;
	input test1 test2 test3;
	test_min = min (test1, test2, test3);
	test_max = max (test1, test2, test3);
	test_mean = mean (test1, test2, test3);
cards;
	3 4 6
	2 -8 9
	9 0 7
	0 0 2
;
run;
proc print;
run;
	