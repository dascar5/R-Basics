#Statisticki model
#=matematicki model koji koristi formulu da prikazuje podatke
#linearna regresija na Iris data set (cvijece)
#3 vrste iris cvijeca
#za te 3 vrste imamo 4 mjerenja (duzina latice, sirina latice, duzina/sirina cvijeta)
#odnos izmedju duzine i sirine latica?
#mozemo li LR da koristimo da predvidimo duzinu latica na osnovu znanih sirina?
#za to cemo da koristimo linearnu regresiju

#loadovanje data seta
#kao i cars, iris je preinstaliran u R, ne moram da ga pozivam iz working dir

data(iris)
head(iris)

#pravimo scatterplot da imamo vizuelno za regresioni model(odnos duzine sa sirinom)
#duzina latica na x osi, sirina na y i krugovi za svaku obzervaciju cvijeta
plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width,
  main="Iris Petal Length vs. Width",
  xlab="Petal Length (cm)",
  ylab="Petal Width (cm)"
)

#pravimo linearni regresioni model za ovo (linija kroz scatter)
model <- lm(
  formula = Petal.Width ~ Petal.Length, #petalwidth je y, petallength x
  data = iris
)
#sumarizacija modela
summary(model)
#intercept estimate nam govori da ce nam linija proci na kroz y gdje je x=-0,36
#petal length= za svaki veci cm duzine, da ocekujemo 0.41 povecanje sirine

#crtanje regresione linije na scatterplot
lines(
  x=iris$Petal.Length,
  y=model$fitted,
  col="red",
  lwd=3 #debljina linije u pikselima
)

#koeficijenat korelacije izmedju duzine i sirine latice
cor(
  x=iris$Petal.Length,
  y=iris$Petal.Width
)
#0,96 (visokra korelacija) zajedno sa modelom, znamo da je duzina dobar prediktor za sirinu latica

#da bi smo predvidjeli nove vrijednosti sa nasim modelom koristimo predict
predict(
  object=model,
  newdata=data.frame(
    Petal.Length=c(2,5,7))
  )
#predvidjamo novu sirinu za zadate duzine (2,5,7)


