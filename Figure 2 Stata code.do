// Figure 2
use "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\BC_CARD_WEEKLY_2019-2020_seoul_to_all.dta"

* additional exclusion
gen add1 = (indtitle_c == "출판인쇄물")|(indtitle_c == "구내매점")|(indtitle_c == "기타업종")
gen add2 = (indtitle_c == "출판인쇄물")|(indtitle_c == "구내매점")|(indtitle_c == "기타업종")|(indtitle_c == "1급호텔")|(indtitle_c == "2급호텔")|(indtitle_c == "기타숙박업")|(indtitle_c == "노래방")|(indtitle_c == "대형할인점")|(indtitle_c == "유흥주점")|(indtitle_c == "일반백화점")|(indtitle_c == "칵테일바")|(indtitle_c == "헬스크럽")

drop if num_stmchk > 0 & geo == 4
drop if (contactless == 1)

tabstat num_total  if (year == 2019 & week >=  5 & week < 20 & add1 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_total  if (year == 2019 & week >= 20 & week <  . & add1 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_total  if (year == 2020 & week >=  5 & week < 20 & add1 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_total  if (year == 2020 & week >= 20 & week <  . & add1 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_stmchk if (year == 2020 & week >= 20 & week <  . & add1 != 1), by(geo) s(sum) format(%15.0fc) 

tabstat num_total  if (year == 2019 & week >=  5 & week < 20 & add2 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_total  if (year == 2019 & week >= 20 & week <  . & add2 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_total  if (year == 2020 & week >=  5 & week < 20 & add2 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_total  if (year == 2020 & week >= 20 & week <  . & add2 != 1), by(geo) s(sum) format(%15.0fc) 
tabstat num_stmchk if (year == 2020 & week >= 20 & week <  . & add2 != 1), by(geo) s(sum) format(%15.0fc)

