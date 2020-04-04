#data vizualizacija
#predstavljanje statistike vizuelno, isto sto sam radio u Jupyter 
#postoje 3 plot sistema u R, base, lattice i ggplot2
#fokusiracemo se na ggplot2 jer je najpopularniji

setwd("C:/Pluralsight")

#citanje CSV fajla
cars<-read.csv("Cars.csv")

#loadovanje ggplot2 biblioteke
library(ggplot2)

#koliko auta imamo svakog tipa transmisije?
#tabela frekvencija
ggplot(
  data=cars,
  aes(x = Transmission))+ #aesthetics, x osa
  geom_bar()+ #geometrija, koji tip charta (bar chart)
  ggtitle("Count of Cars by Transmission Type")+
  xlab("Transmission Type")+
  ylab("Count of Cars")

#sad potrosnja, to je numericka vrijednost pa bi histogram fino izgledao recimo
ggplot(
  data=cars,
  aes(x=Fuel.Economy))+
  geom_histogram(
    bins=10)+   #10 binova za nase podatke, vise sire, manje uze
  ggtitle("Distribution of Fuel Economy")+
  xlab("Fuel Economy(mpg)")+
  ylab("Count of Cars")

#density plot za fuel economy
ggplot(
  data=cars,
  aes(x=Fuel.Economy))+
  geom_density()+
  ggtitle("Distribution of Fuel Economy")+
  xlab("Fuel Economy(mpg)")+
  ylab("Density")
#gore kolona je za koje su sanse da se FE nalazi u tom rasponu
#dolje kolona je za raspon, tj. samu FE

#kako se broj cilindara odnosi na potrosnju?
#koristimo scatterplot jer su oba numericki
ggplot(
  data=cars,
  aes(
    x=Cylinders,
    y=Fuel.Economy))+
  geom_point()+
  ggtitle("Fuel Economy by Cylinders")+
  xlab("Number of Cylinders")+
  ylab("Fuel Economy(mpg)")
#kako se broj cilindara povecava, smanjuje se FE (potrosnja)
