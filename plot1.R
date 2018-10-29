setwd("~/Documents/JH/TDI/TDI")
microdata = read.csv("recs2015_public_v3.csv", header = T)
microdata.cost = microdata[, c(1:6,631,674,694,708,713)]
cost.division = aggregate(x = microdata.cost[,c(7:11)], by = list(microdata.elec$DIVISION), FUN = "mean")
cost.division$division = c(
"New England",
"Middle Atlantic",
"East North Central",
"West North Central",
"South Atlantic",
"East South Central",
"West South Central",
"Mountain North",
"Mountain South",
"Pacific"
)

colnames(cost.division) = c("divisionid", "Electricity", "Natural Gas", "Propane", "Fuel oil/kerosene", "Total", "Division")

library(reshape)
library(ggplot2)
dat.m <- melt(cost.division[,-c(1,6)],id.vars = "Division") 
c <- ggplot(dat.m, aes(x = factor(Division), y = value, fill = variable))
c + geom_bar(stat = "identity") + ylab("Annual Cost in 2015 (dollars)") + xlab("Geography Division") + theme(axis.text.y=element_text(size=15,colour = "black"),axis.text.x=element_text(size=13,colour = "black",angle=45, hjust=1),axis.title=element_text(size=13)) + ylim(c(0,3000)) + theme(legend.title = element_blank()) + theme(legend.text=element_text(size=13))

