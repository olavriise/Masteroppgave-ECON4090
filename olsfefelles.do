cd "G:\ISF10362_Tilknytningsformer\Registerstudier\Olav\grafer"

gen kokk = 0
replace kokk = 1 if yrk4 == "5122"
gen vekter = 0
replace vekter = 1 if yrk4 == "5164"

xtset personidnum aarnum
//Regresjon felles for alle yrkene
eststo: reg ln_lonn outsourcet alder alder2 kvinne i.aarnum i.yrknum if matarbrest != 1 & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum i.yrknum if matarbrest != 1 & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum i.yrknum if okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & matarbrest != 1, fe
esttab using FellesOLSFE.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet yrknum)
eststo clear

esttab using olsfealleyrk.tex, b(3) se(3) r2 nomtitle label drop(2018.aarnum 2017.aarnum 2016.aarnum 2015.aarnum 2014.aarnum 2013.aarnum 2012.aarnum 2011.aarnum 2010.aarnum 2009.aarnum 2008.aarnum 2007.aarnum 2006.aarnum 2005.aarnum 2004.aarnum)

//Regresjon for matarbeidere, assistenter og kokker, OLS først så FE
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet kokk i.aarnum if matarbeider == 1  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum kokk if matarbeider == 1 & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9133" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5122" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0, fe
esttab using matasskokkOLSFE2.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet kokk)
eststo clear

//Regresjon for vaktmestere, OLS først og så FE
eststo: reg ln_lonn outsourcet alder alder2 kvinne i.aarnum if yrk4 == "5163" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5163" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5163" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1, fe
esttab using vaktmesterOLSFE.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet)
eststo clear

//Regresjon for vakter/dørvakter og vektere, OLS først og så FE
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet vekter i.aarnum if sikkerhet == 1 & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9152" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5164" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: xtreg ln_lonn outsourcet alder2 vekter i.aarnum if sikkerhet == 1 & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9152" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5164" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1, fe
esttab using sikkvaktvekterOLSFE2.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet vekter)
eststo clear

//Regresjon for renholdere, OLS først og så FE
eststo: reg ln_lonn outsourcet alder alder2 kvinne i.aarnum if yrk4 == "9132" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9132" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9132" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1, fe
esttab using renholdOLSFE.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet)
eststo clear

//Forskjell på innvandrere og ikke-innvandrere

//Assistenter
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 0, fe
esttab using assistinnvandrer.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne lavutdannet)
eststo clear

//Kokker
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & innvandrer == 0, fe
esttab using kokkinnvandrer.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne lavutdannet)
eststo clear

//Vakter og dørvakter
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0, fe
esttab using vaktdorvaktinnvandrer.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne lavutdannet)
eststo clear

//Vektere
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0
eststo: xtreg ln_lonn outsourcet alder alder2 i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1, fe
eststo: xtreg ln_lonn outsourcet alder alder2 i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0, fe
esttab, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne lavutdannet)
eststo clear

//Vaktmestere
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0, fe
esttab using vaktmesterinnvandrer.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne lavutdannet)
eststo clear

//Renholdere
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne lavutdannet i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & innvandrer == 0, fe
esttab using renholderinnvandrer.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne lavutdannet)
eststo clear

//Forskjell på kvinner og menn 

//Assistenter
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 1
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 0, fe
esttab using assistentkjonn.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 innvandrer lavutdannet)
eststo clear

//Kokker
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 1
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & kvinne == 0, fe
esttab using kokkkjonn.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 innvandrer lavutdannet)
eststo clear

//Vakter og dørvakter
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9152"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0, fe
esttab using vaktdorvaktkjonn.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 innvandrer lavutdannet)
eststo clear

//Vektere
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5164"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0, fe
esttab using vekterkjonn.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 innvandrer lavutdannet)
eststo clear

//Vaktmestere
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "5163"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0, fe
esttab using vaktmesterkjonn.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 innvandrer lavutdannet)
eststo clear

//Renholdere
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1
eststo: reg ln_lonn outsourcet alder alder2 innvandrer lavutdannet i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 1, fe
eststo: xtreg ln_lonn outsourcet alder2 i.aarnum if yrk4 == "9132"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & kvinne == 0, fe
esttab using renholderkjonn.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 innvandrer lavutdannet)
eststo clear