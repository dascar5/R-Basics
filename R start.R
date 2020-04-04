#Assign and print Hello World
x <- "Hello World!"
#Print
print (x)

#implicintno stampanje, umjesto print(x) mogu samo x
x
#cudna deklaracija
l <- TRUE
i <- 123L #pretvara broj u LONG tip
h <- 1.23 #decimale
c <- "ABC 123" #string
d <- as.Date("2001-02-03") #datum

#ne zaboravi da ctrl+enter posle svake deklaracije varijable!

l
i
h
c
d

#kreairanje funkcije, isto kao deklaracija varijable
f <- function(x) {x+1} 
#ovdje postavljamo funkciju sa nepoznatom x
#pozivanje funkcije
f(2)
#2 ide u x+1 funkciju i dobijamo rezultat

#vektor je jednodimenzionalni niz koji sadrzi elemente istog tipa
v <- c(1,2,3);
v
#c je funkcija concatination, tj. spajanja

#sekvenca - vektor numerickih u usponu ili padu jedinica, tipa
s <- 1:5
s
#slicno sto i vektor, samo sto u vektoru nabrajamo, a ovdje od a do z

#matrica, dvodimenzionalni niz
#recimo, zelimo da napravimo matricu 2x3,koja sadrzi 6 podataka,
#u dvije kolone i 3 reda
m <- matrix(
  data = 1:6,
  nrow = 2,
  ncol = 3
)
m

#mozemo da pravimo multidimenzione nizove u R koriscenjem array
#ako zelimo da napravimo 2x2x2 niz od 8 podataka, koristimo array
a <- array (
  data = 1:8,
  dim = c(2,2,2))
a

#list se koristi za skupljanje podataka razlicitih tipova podataka
l <- list(TRUE,123L,2.34,"abc") #boolean, long, float, string
l

#factor cuva kategorije imenovanih valuta
#factor se koriste za kategorisanje podataka i cuvanje po nivoa
#korisne u slucaju male/female, true/false, gdje masu tih podataka
#dijeli na samo te dvije kategorije, MNOGO VAZNo!
categories <-c ("Male","Female","Male","Male","Female")
factor <- factor (categories)
factor
levels (factor)
unclass (factor)
#mapiranje po integerima, female na int 1 a male na int 2

#data frame je najbitnija struktura podataka za rad sa tabelarnim
#podacima u R
#set kolona i redove, mogu da sadrze razlicite tipove podataka,
#ali sve u istu kolonu mora biti istog tipa!
df<- data.frame(
  Name = c("Cat","Dog","Cow","Pig"),
  HowMany = c(5,10,15,20),
  IsPet = c(TRUE,TRUE,FALSE,FALSE)
)
df
#indeksiranje data frejmova po redu i koloni
df[1,2]
#po redu
df[1,]
#po koloni
df[,1]
df[,2]
df[["HowMany"]]
df$HowMany


#subsetting data frames nam dozvoljava da slice/dice data kako hocemo
#manipulacija rezultata, itd
df[c(2,4),] #vrace redove 2 i 4
df[2:4,] #vrace sve redove od 2 do 4
df[c(TRUE,FALSE,TRUE,FALSE),] #nebitno, neprakticno
df[df$IsPet==TRUE,] #izbaca mi sve rez gdje je IsPet TRUE
df[df$HowMany>10,] #izbaca mi sve rez gdje je broj > 10
df[df$Name %in% c("Cat","Cow"),] #nadji sve redove sa Cat i Cow u Name


#R je vektorizovan jezik, sto znaci da razultati i varijable nisu
#jedna, atomska vrijednost, vec vektor, pa makar od jedno vrijednosti,
#sto znaci da 1+2 daje vektor od jednog clana, 3
1+2
c(1,2,3)+c(2,4,6) #3,6,9

#named vs ordered arguments
#gore sam pravio matricu sa nrow i ncol, ali ne moram da kucam to
#ako znam red pravljenja matrice, tj sintaksu, sto znaci:
m <- matrix(data = 1:6, nrow = 2, ncol = 3)
#je isto sto i:
n <- matrix (1:6, 2, 3)
#to provjeravamo sa
m == n
identical (m,n)


#instaliranje paketa
install.packages("dplyr")

#citanje pomoci
?data.frame

#prije rada u R trebaju nam data setovi
#importovanje data, transformisanje i rad sa njim i eksportovanje
#tipa biramo kolone, redove, grupisemo na osnovu sto nam treba itd

#base package sadrzi vec ukljucene funkcije za rad sa podacima
#sad se radi o obradjivanju data setova za rad u rstudio
#tidyr se koristi za ciscenje podataka da ih pretvori na takav nacin
#da mogu raditi sa njima
#reshape2 je isto samo kompleksnija sintaksa
#stringr rad sa stringovima
#lubridate rad sa datumima
#validate za validaciju podataka
#plyr kidanje i concat podataka
#dplyr slicno ali sa tabelama, kompleksnije itd
#data.table slicno sa plyr i dplyr ali slicna sintaksa kao df
#sqldf isto kao gore ali rad sa sql
#sada se koristi samo dplyr jer je jako mocan i lak
#na kraju obrade svega samo se eksportuje u citljiv tip (pdf, csv..)

#dplyr radi sa svim tipovima podacima
#sintaksa
#Select bira 
#Filter filteruje na osnovu kriterijuma koje mi damo
#Mutate kreira novu kolonu tako sto transformuje postojecu kolonu u novu formu
#Summarize sabira na osnovu iste vrijednosti
#Arrange sortira na osnovu kriterija
#dosta slicno sql-u

#najtezi posao u data science je sredjivanje data setove
#data janitor
#podaci nisu fini, ti moras da ih sredis
#napraviti skriptu koju pokreces iznova jer je sve skoro isto


