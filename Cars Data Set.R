#rad sa cars datasetom

#postavljanje radne direktorije
setwd ("C:/Pluralsight")

#citanje data seta
cars <- read.table(
  file = "Cars.txt",
  header = TRUE,
  sep = "\t", #tabela su odvojena tabovima
  quote = "\"" #razdvoj teksta, sve unutar navodnika je tekst
  )

#citanje podataka
head(cars)

#loadovanje dplyr paketa u memoriju
library(dplyr)

#biranje subseta kolona sa kojim zelim da radim, recimo
temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)
#isto kao prije ali nova tabela sa subsetom kolona
head(temp)

#filterovanje odredjenih redova, gdje je transmission automatic
temp<- filter(
  .data = temp,
  Transmission == "Automatic")
)
#insektovanje rezultata, head samo prvih 6 pokazuje
head(temp)

#sada koristimo mutate da promijenimo milje po galonu u litre po km
temp <- mutate(
  .data = temp,
  Consumption = Fuel.Economy * 0.425
)
head(temp)
#sa time smo dobili novu kolonu consumption
#Fuel Economy je Consumption u evropi, ista stvar samo je sad km/l

#sada grupisemo podatke po broju cilindara, sa group_by
temp <- group_by(
  .data = temp,
  Cylinders
)
head(temp)
#konzola nam govori da imamo 3 vrste cilindara (4,6,8)

#agregisanje na osnovu grupa, sumarizacija
temp <- summarize(
  .data = temp,
  Avg.Consumption = mean(Consumption)
)
#ovo govori R da nam racuna medijsku sredinu potrosnje na osnovu broja cilindara
head(temp)

#sortiranje redova po spustajucem redu na osnovu potrosnje
#most fuel efficient on the top, arrange function

temp <- arrange(
  .data = temp,
  desc(Avg.Consumption)
)
head(temp)

#data je vec bilo u ovom redu, jebi ga
#sad konvertovanje ovoga u data frame

efficiency <- as.data.frame(temp)
print(efficiency)
#efficiency je nova varijabla, data frame tempa

#ovo sto sam do sada radio je neefikasan primjer rada sa podacima
#ne radi se jedna po jedna funkcija, vec se koristi method chaining, koriscenjem operatora
#%>%
#isti kurac, samo sto kucam jendu po jednu vezem ih sa ovim i pravim kontinuitet metoda

efficiency <- cars %>%
  select(Fuel.Economy, Cylinders, Transmission) %>%
  filter(Transmission == "Automatic") %>%
  mutate(Consumption = Fuel.Economy*0.425) %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption = mean (Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()

print(efficiency)

#ista, samo pregledniji kod

#eksportovanje u csv
write.csv(
  x=efficiency,
  file = "Fuel Efficiency.csv",
  row.names = FALSE #ne treba nam unique ID za svaki red
)
