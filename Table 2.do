* Event Study
use "D:\Dropbox\Gentrification\4. Emergency relief payment\BC_CARD_WEEKLY_2019-2020_seoul_to_all.dta", clear

keep if (week >= 16 & week <= 23)
drop if (contactless == 1)
drop if (add1 == 1)

* dependent variable
gen        num_total_pc = num_total / cus_total
replace    num_total_pc = 0 if (cus_total == 0)
gen     ln_num_total_pc = ln(num_total_pc)

* pre/post
gen post = (week >= 20)
egen ind_c = group(indcode_c)

* targeted industry
gen target = (indtitle_c == "1급호텔")|(indtitle_c == "2급호텔")|(indtitle_c == "기타숙박업")|(indtitle_c == "노래방")|(indtitle_c == "대형할인점")|(indtitle_c == "유흥주점")|(indtitle_c == "일반백화점")|(indtitle_c == "칵테일바")|(indtitle_c == "헬스크럽")

* regression models
reg ln_num_total_pc ib1.geo##ib2019.year##i.post i.age2 i.female i.inc2 i.occ2 i.ind_c i.franchise i.orig_cd i.dest_cd i.week                  [weight = cus_total], robust
reg ln_num_total_pc ib1.geo##ib2019.year##i.post i.age2 i.female i.inc2 i.occ2 i.ind_c i.franchise i.orig_cd i.dest_cd i.week if (target != 1) [weight = cus_total], robust
