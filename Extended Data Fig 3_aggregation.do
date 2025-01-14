use "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\Revision_Results Sharing_Jieun\BC_Card_weekly_dong_dong_num_total_num_stmchk_wk10_to_35_in2020_ver3.dta" 
keep if orig_sido == "서울특별시"
collapse (sum) num_total num_stmchk if week >= 20 & week <= 35, by(week)
export excel using "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\Revision_Results Sharing_Jieun\Extended Data Fig 3.xlsx", firstrow(variables)