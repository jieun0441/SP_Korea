// Table 1 - Mobility

use "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\A1. Mobility(SK_inflow)\Inflow_regression_data.dta"

sum inflow_except_mydong inflow_from_Seoul if (week_num >=5 & week_num<=19) & (year ==2020)
sum inflow_except_mydong inflow_from_Seoul if (week_num >=20 & week_num<=31) & (year ==2020)

// Table 1 - Card
* file
use "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\Final version_Data and Code\Table 1_Dataset_BC_CARD_WEEKLY_2020_seoul residents_to_all_obs15426103.dta"

* Credit Card Transactions of Seoul residents
// use "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\BC_CARD_WEEKLY_2019-2020_seoul_to_all.dta" 
//HJ교수님 코드- gen contactless = (indtitle_c == "PG상품권")|(indtitle_c == "고속버스")|(indtitle_c =="대학등록금")|(indtitle_c =="상품권")|(indtitle_c =="위성방송")|(indtitle_c =="이동통신요금")|(indtitle_c =="인터넷Mall")|(indtitle_c =="인터넷PG")|(indtitle_c =="인터넷종합Mall")|(indtitle_c =="전자상거래상품권")|(indtitle_c =="철도")|(indtitle_c =="택시")|(indtitle_c =="통신판매")|(indtitle_c =="홈쇼핑")|(indtitle_c == "기타업종")|(indtitle_c == "연쇄점")|(indtitle_c == "공공요금")|(indtitle_c == "조세서비스")|(indtitle_c == "사무서비스")|(indtitle_c == "통신서비스")|(indtitle_c == "위탁급식업")|(indtitle_c == "위성방송")|(indtitle_c == "항공사")
// add1 = (indtitle_c == "출판인쇄물")|(indtitle_c == "구내매점")|(indtitle_c == "기타업종")
gen add2 = (indtitle_c == "출판인쇄물")|(indtitle_c == "구내매점")|(indtitle_c == "기타업종")|(indtitle_c == "1급호텔")|(indtitle_c == "2급호텔")|(indtitle_c == "기타숙박업")|(indtitle_c == "노래방")|(indtitle_c == "대형할인점")|(indtitle_c == "유흥주점")|(indtitle_c == "일반백화점")|(indtitle_c == "칵테일바")|(indtitle_c == "헬스크럽")

* keep 2020
keep if year == 2020

* excldue online
keep if contactless != 1

* No. of physical credit card transactions and SP --------------------
* week 5-19 
tabstat num_total num_stmchk if (week>=5)&(week<=19)&(add1!=1), s(sum) format(%15.0fc)

* week 20-35 
tabstat num_total num_stmchk if (week>=20)&(add1!=1), s(sum) format(%15.0fc)

* No. of stimulus targeted transaction ---------------
* week 5-19 
tabstat num_total if (week>=5)&(week<=19)&(add2!=1), s(sum) format(%15.0fc)

* week 20-35 
tabstat num_total if (week>=20)&(add2!=1), s(sum) format(%15.0fc)


* No. of transactions within one's own neighbourhood---------------
* week 5-19 
tabstat num_total if (week>=5)&(week<=19)&(add1!=1)&(orig_cd == dest_cd), s(sum) format(%15.0fc)

* week 20-35 
tabstat num_total if (week>=20)&(add1!=1)&(orig_cd == dest_cd), s(sum) format(%15.0fc)


* No. of transactions in other Seoul neighbourhoods-------------
* week 5-19 
tabstat num_total if (week>=5)&(week<=19)&(add1!=1)&(geo==2 | geo == 3), s(sum) format(%15.0fc)

* week 20-35 
tabstat num_total if (week>=20)&(add1!=1)&(geo == 2| geo == 3), s(sum) format(%15.0fc)


* No. of transactions in Non-Seoul by Seoul residents ------------------
* week 5-19 
tabstat num_total if (week>=5)&(week<=19)&(add1!=1)&(geo==4), s(sum) format(%15.0fc)

* week 20-35 
tabstat num_total if (week>=20)&(add1!=1)&(geo==4), s(sum) format(%15.0fc)


* Customer Attributes
summarize female i.age2 i.inc2 i.occ2 if (contactless == 0)&( add1==0)&(week>=5)&(week<=19)
summarize female i.age2 i.inc2 i.occ2 if (contactless == 0)&( add1==0)&(week>=20)&(week<=35)

save "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\Final version_Data and Code\Table 1_Dataset_BC_CARD_WEEKLY_2020_seoul residents_to_all_obs15426103.dta"



**NS residents ****************
use "C:\Users\jieun\Dropbox\Gentrification\1. DATA\9. BC_CARD_WEEKLY_2019-2020\BC_CARD_WEEKLY_20210225ver_2020\BC_CARD_WEEKLY_2020.dta"

drop if orig_sido == "서울특별시"
gen contactless = (indtitle_c == "PG상품권")|(indtitle_c == "고속버스")|(indtitle_c =="대학등록금")|(indtitle_c =="상품권")|(indtitle_c =="위성방송")|(indtitle_c =="이동통신요금")|(indtitle_c =="인터넷Mall")|(indtitle_c =="인터넷PG")|(indtitle_c =="인터넷종합Mall")|(indtitle_c =="전자상거래상품권")|(indtitle_c =="철도")|(indtitle_c =="택시")|(indtitle_c =="통신판매")|(indtitle_c =="홈쇼핑")|(indtitle_c == "기타업종")|(indtitle_c == "공공요금")|(indtitle_c == "통신서비스")|(indtitle_c == "위성방송")|(indtitle_c == "항공사")

keep if contactless != 1
gen add1 = (indtitle_c == "출판인쇄물")|(indtitle_c == "구내매점")|(indtitle_c == "기타업종")
gen add2 = (indtitle_c == "출판인쇄물")|(indtitle_c == "구내매점")|(indtitle_c == "기타업종")|(indtitle_c == "1급호텔")|(indtitle_c == "2급호텔")|(indtitle_c == "기타숙박업")|(indtitle_c == "노래방")|(indtitle_c == "대형할인점")|(indtitle_c == "유흥주점")|(indtitle_c == "일반백화점")|(indtitle_c == "칵테일바")|(indtitle_c == "헬스크럽")

* No. of physical credit card transactions and SP --------------------
* week 5-19 (physical, SP target)
tabstat num_total if (week>=5)&(week<=19)&(add1!=1), s(sum) format(%15.0fc)
tabstat num_total if (week>=5)&(week<=19)&(add2!=1), s(sum) format(%15.0fc)
* week 20-35 (physical, SP target)
tabstat num_total if (week>=20)&(add1!=1), s(sum) format(%15.0fc)
tabstat num_total if (week>=20)&(add2!=1), s(sum) format(%15.0fc)

save "C:\Users\jieun\Dropbox\Gentrification\4. Emergency relief payment\Final version_Data and Code\Table 1_Dataset_BC_CARD_WEEKLY_2020_Nonseoul residents_to_Seoul.dta"