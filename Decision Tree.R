#Predicting with Machine Learning
#klasifikacija, regresija, klasterovanje, detekcija anomalija (sve se to moze predvidjati)
#vise tipova ucenja
#supervizovano (mi oznacimo podatke i na osnovu toga radi komp)
#nesupervizovano (ne oznacavamo nista nego masina nalazi patterns)
#reinforcement (vruce hladno)
#vec sam radio supervized u proslom demu (petal length/width)
#u ovom demu cemo raditi klasifikaciju (decision tree)

#prvo imamo set podataka, sredimo ih (oznacavanje, ciscenje)
#splitovanje podataka (trening set i test set)
#ponekad se dijeli i na 3 (trening set, set za validaciju i konacni data test)
#onda pohranjujemo nas trening set u ML algoritam
#od ovoga se pravi ML model
#nakon sto to odradimo, guramo test set u ML model da vidimo da li se predikcije
#poklapaju sa odgovorima u test data set
#onda deploy to production i hranimo ga production data
#tu onda predvidjamo
#radimo decision tree
#klasifikacija
#predvidjanje kategoricne vrijednosti

#iris data seet
#predvidjamo vrstu cvijeta na osnovu podataka koje znamo

data(iris)

#postavljamo seed za nasumicnost
set.seed(42) #nasumican broj

#dijelimo iris data set na trening data set i test data set
#kako imamo 150 redova, zelimo recimo 100 za trening, 50 za test
#program ih nasumicno uzima za podjelu
indexes <- sample(
  x=1:150,
  size=100
)
#inpekcija trening seta
print(indexes)
#100 nasumicno izabranih indeksa redova
#sad pravimo trening data set od ovih indeksa
#pravimo subset iris data seta tako sto prosledjujemo index
#redova koje zelimo da samplujemo u row index arg i ostavimo
#col index argument prazan jer zelimo sve kolone

train <- iris[indexes,] #varijabla train gdje se nalazi 100 komada za trening
test <- iris[-indexes,] #varijabla test gdje se nalazi ostatak za validaciju

#loadovanje paketa za decision tree
library(tree)

#treniranje decision tree modela
model <-tree(
  formula = Species ~., #species kao funkcija svih drugih kategorija u iris ds
  data=train
)

#ispekcija modela
summary(model)

#vizualizacija decision tree modela
plot (model)
text(model)

#mozemo i drugacije da viz. ovaj DS, kao scatterplot

#loadovanje color brewer biblioteke
library(RColorBrewer)
#kreairanje color palete
palette<-brewer.pal(3,"Set2") #3 boje iz seta 2
#kreairanje scatterplota sa bojama po vrstama

plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width,
  pch=19,
  col=palette[as.numeric(iris$Species)],
  main="Iris Petal Length vs. Width",
  xlab="Petal Length(cm)",
  ylab="Petal Width(cm)"
)

#plotovanje DT granica
partition.tree(
  tree=model,
  label="Species",
  add=TRUE
)
#validacija modela
#da vidimo koliko je tacan
#predikcija sa modelom = validacija

predictions <- predict(
  object = model,
  newdata = test,
  type = "class"
)

#pravljenje confusion matrix
table(
  x=predictions,
  y=test$Species
)
#ovo nam pokazuje koliko je predikcija tacno a koliko netacno klasificirano
#x osa su predikcije
#y su tacne vrste
#sve setose tacne
#16 smo tacno versicolor testirali
#ali smo jednu pogresno kao virginica
#prilicno tacno
#medjutim CM je previse simple i nedovoljan indikator
#treba nam malo vise podataka o tacnosti

library (caret)
#isto pravimo CF ali ova je iz paketa caret pa je bolja
confusionMatrix(
  data = predictions,
  reference = test$Species
)
setwd("C:/Pluralsight")
#cuvanje tree modela
save(model,file = "Tree.RData")
