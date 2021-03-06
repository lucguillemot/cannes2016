library(reshape2)
library(jsonlite)
library(dplyr)

# CANNES
ca <- read.csv("ca.csv")
ca <- ca[1:13]
ca.cc <- ca[!!rowSums(abs(ca[-c(1:2)])),]
ca2 <- rev(ca.cc[4:13])
ca3 <- cbind(ca.cc$PAYS, ca2)
colnames(ca3)[1] <- "PAYS"
ca4 <- melt(ca3)
ca5 <- toJSON(ca4, pretty = TRUE)
ca6 <- as.data.frame(t(ca2))

years <- as.data.frame(row.names(ca6))
years[, 2] <- as.character(c(2006:2015))

write.csv(as.character(years[, 1]), "years.csv", row.names = FALSE)
write.csv(years, "years-correspondance.csv", row.names = FALSE)
write.csv(ca.cc$PAYS, "cannes_countries.csv", row.names = FALSE)
write.csv(cannes, "cannes.csv", row.names = FALSE)
write(ca5, "cannes.json")

# CANNES - UN CERTAIN REGARD
ucr <- read.csv("ucr.csv")
ucr.cc <- ucr[!!rowSums(abs(ucr[-c(1:2)])),]
ucr2 <- rev(ucr.cc[3:12])
ucr3 <- cbind(ucr.cc$PAYS, ucr2)
colnames(ucr3)[1] <- "PAYS"
ucr4 <- melt(ucr3)
ucr5 <- toJSON(ucr4, pretty = TRUE)
write(ucr5, "uncertainregard.json")

ucr6 <- as.data.frame(t(ucr2))

years_ucr <- as.data.frame(row.names(ucr6))
years_ucr[, 2] <- as.character(c(2006:2015))

write.csv(row.names(ucr6), "years_ucr.csv", row.names = FALSE)
write.csv(years_ucr, "years_ucr-correspondance.csv", row.names = FALSE)
write.csv(ucr.cc$PAYS, "ucr_countries.csv", row.names = FALSE)

# SYNTHESE

synt <- read.csv("synthese.csv")
synt.cc <- synt[!!rowSums(abs(synt[-c(1:2)])),]
synt2 <- melt(synt)
syntJS <- toJSON(synt2, pretty = T)
write(syntJS, "synthese.json")

# BERLIN
be <- read.csv("be.csv")
be2 <- rev(be[3:30])
be3 <- cbind(be[2], be2)
be4 <- melt(be3)
be5 <- toJSON(be4, pretty = TRUE)
write(be5, "berlin.json")

# VENISE
ve <- read.csv("ve.csv")
ve2 <- rev(ve[3:30])
ve3 <- cbind(ve[2], ve2)
ve4 <- melt(ve3)
ve5 <- toJSON(ve4, pretty = TRUE)
write(ve5, "venise.json")

# MOSCOU
mo <- read.csv("mo.csv")
mo2 <- rev(mo[3:30])
mo3 <- cbind(mo[2], mo2)
mo4 <- melt(mo3)
mo5 <- toJSON(mo4, pretty = TRUE)
write(mo5, "moscou.json")

# LOCARNO
lo <- read.csv("lo.csv")
lo2 <- rev(lo[3:30])
lo3 <- cbind(lo[2], lo2)
lo4 <- melt(lo3)
lo5 <- toJSON(lo4, pretty = TRUE)
write(lo5, "locarno.json")


# CANNES - REGROUPEMENTS
ca_reg <- read.csv("ca2.csv")
ca_reg2 <- rev(ca_reg[3:30])
ca_reg3 <- cbind(ca_reg[2], ca_reg2)
ca_reg4 <- melt(ca_reg3)
ca_reg5 <- toJSON(ca_reg4, pretty = TRUE)
write(ca_reg5, "cannes2.json")
write.csv(ca_reg$PAYS, "pays_reg.csv", row.names = FALSE)