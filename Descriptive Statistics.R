#pravljenje deskriptivne statistike

#radni direktorijum
setwd("C:/Pluralsight")

#sada radimo sa CSV fajlom
cars<-read.csv("Cars.csv")
head(cars)
#sve ostalo na default (header, separator, itd)

#pravimo frequency table da znamo koliko auta imamo od svakog transmissiontipa
table (cars$Transmission)

#minimalna vrijednost
min(cars$Fuel.Economy)

#max vrijednost
max(cars$Fuel.Economy)

#srednja, saberes sve i podijelis sa brojem clanova
mean(cars$Fuel.Economy)

#median (srednji clan)
median(cars$Fuel.Economy)

#kvartali (koliko ih ima po 25% procenata (25,50,75,100))
quantile(cars$Fuel.Economy)

#standardna devijacija
sd(cars$Fuel.Economy)

#sabiranje svih vrijednosti
sum(cars$Fuel.Economy)

#korelacijski koeficijent, recimo odnos izmedju cilindara i potrosnje goriva
cor(
  x=cars$Cylinders,
  y=cars$Fuel.Economy
)
#negativan je, sto znaci negativna jaka obrtna relacija (nisu povezani)

#sumarizacija cijele tabele
summary(cars)
