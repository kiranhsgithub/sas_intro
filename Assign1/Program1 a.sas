filename aaupfile '~/Assign1/AAUP_data.txt'; 
data aaup;
infile aaupfile delimiter=',';
input fice univ_name $ state $ type $ avg_sal_full_prof avg_sal_assoc_prof avg_sal_asst_prof avg_sal_all 
	avg_comp_full_prof avg_comp_assoc_prof avg_comp_asst_prof avg_comp_all;

RUN;
PROC PRINT data=aaup;
RUN;

data aaupcopy1;
	set aaup;
	drop univ_name type; 
run;
proc print data=aaupcopy1;
run;

data aaupcopyak;
	set aaupcopy1; 
if  state = 'AK';
run;
proc print data=aaupcopyak;
run;

data aaupcopyal;
	set aaupcopy1; 
if  state = 'AL';
run;
proc print data=aaupcopyal;
run;

data aaupaktotalincome;
	set aaupcopyak;
	drop avg_sal_full_prof avg_sal_assoc_prof avg_sal_asst_prof avg_sal_all 
	avg_comp_full_prof avg_comp_assoc_prof avg_comp_asst_prof avg_comp_all;
	total_income_full_prof = avg_sal_full_prof + avg_comp_full_prof; 
	total_income_assoc_prof = avg_sal_assoc_prof + avg_comp_assoc_prof; 
	total_income_asst_prof = avg_sal_asst_prof + avg_comp_asst_prof;
	total_income_all = avg_sal_all + avg_comp_all;
run;
proc print data=aaupaktotalincome;
run;

data aaupaltotalincome;
	set aaupcopyal;
	drop avg_sal_full_prof avg_sal_assoc_prof avg_sal_asst_prof avg_sal_all 
	avg_comp_full_prof avg_comp_assoc_prof avg_comp_asst_prof avg_comp_all;
	total_income_full_prof = avg_sal_full_prof + avg_comp_full_prof; 
	total_income_assoc_prof = avg_sal_assoc_prof + avg_comp_assoc_prof; 
	total_income_asst_prof = avg_sal_asst_prof + avg_comp_asst_prof;
	total_income_all = avg_sal_all + avg_comp_all;
run;
proc print data=aaupaltotalincome;
run;


