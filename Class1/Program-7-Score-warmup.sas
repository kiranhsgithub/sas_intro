data score;
	input name $ math sport music;
	total = math + sport + music;
cards;
Daniel 98 87 89
Mark 76 . 90
Bill 90 91 89
;
run;
proc print;
run;