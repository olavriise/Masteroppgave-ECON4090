//assistent,kokk endret == 1 først så endret == 0, første to kolonner er kjøkkenassistenter, siste to er kokker
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & endret == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9133"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & endret == 0
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & endret == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5122"  & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & restaurant == 0 & endret == 0
esttab, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet)
eststo clear

//vaktmester, endret == 1 først, så endret == 0
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5163" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5163" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 0
esttab using vaktmesterstatus.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet)
eststo clear

//Vakt/dørvakt vekter, endret ==1 først, så endret == 0, første to kolonner er vakter/dørvakter, siste to kolonner er vektere
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9152" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9152" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 0
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5164" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "5164" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 0
esttab using vaktvekterstatus.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet)
eststo clear

//Renhold, endret == 1 først, så endret == 0
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9132" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 1
eststo: reg ln_lonn outsourcet alder alder2 kvinne innvandrer lavutdannet i.aarnum if yrk4 == "9132" & okresidual == 1 & normalmengdejobb == 1 & normallonn == 1 & endret == 0
esttab using renholdstatus.tex, b(3) se(3) r2 nomtitle label keep(outsourcet alder alder2 kvinne innvandrer lavutdannet)
eststo clear