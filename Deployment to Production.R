#Deploying to Production
#Shiny je biblioteka koju koristimo da guramo nas model na server, povezemo ga sa
#ui i tako dobijemo interaktivnu web app

library(shiny)

#pravljenje UI
ui <- fluidPage("Hello World!")

#pravljenje servera
server <- function(input,output){}

#povezivanje UI i servera
shinyApp(
  ui = ui,
  server = server
)

#kreairanje Shiny aplikacije koja daje single input/output
ui <- fluidPage(
  titlePanel("Input and Output"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "num",
        label = "Choose a Number",
        min = 0,
        max = 100,
        value = 25
      )
    ),
    mainPanel (
      textOutput(
        outputId = "text"
      )
    )
  )
)

#sad pravimo server za ovo
server <- function (input,output){
  output$text <- renderText({
    paste("You selected ", input$num)
  })
}
#povezivanje
shinyApp(
  ui=ui,
  server=server
)
#sad konkretno da radim sa modelom 

setwd("C:/Users/Bogdan/Desktop/Vjezba R")
#loadovanje tree modela
load("Tree.RData")
#loadovanje color brewer
library(RColorBrewer)
#kreiranje palete boja

#pravimo UI za model
ui <- fluidPage(
  titlePanel("Iris Species Predictor"),
  sidebarLayout(
    sidebarPanel (
      sliderInput(
        inputId = "petal.length",
        label = "Petal Length (cm)",
        min=1,
        max=7,
        value=4
      ),
      sliderInput(
        inputId = "petal.width",
        label="Petal Width(cm)",
        min=0.0,
        max=2.5,
        step=0.5,
        value=1.5
      )
    ),
    mainPanel(
      textOutput(
        outputId = "text"
      ),
      plotOutput(
        outputId = "plot"
      )
    )
  )
)
#pravljenje servera za model
server <- function(input,output){
  output$text=renderText({
    
    #pravljenje prediktora
    
    predictors <- data.frame(
      Petal.Length=input$petal.length,
      Petal.Width=input$petal.width,
      Sepal.Length=0, #ovo dvoje na nulu jer ne trebaju DT za predikcije
      Sepal.Width=0
    )
    
    #pravljenje predikcija
    prediction=predict(
      object = model,
      newdata=predictors,
      type="class"
    )
    
    #pravljenje predikcijskog teksta
    paste(
      "The predicted species is ",
      as.character(prediction)
    )
  })
  output$plot=renderPlot({
    #pravljenje scatterplota sa posebnik bojana
    plot(
      x=iris$Petal.Length,
      y=iris$Petal.Width,
      pch=19,
      col=palette[as.numeric(iris$Species)],
      main = "Iris Petal Length vs. Width",
      xlab = "Petal Length(cm)",
      ylab = "Petal Width(cm)"
    )
    #plotovanje decision tree granica
    partition.tree(
      model,
      label="Species",
      add=TRUE
    )
    #crtanje prediktora po plotu
    points(
      x=input$petal.length,
      y=input$petal.width,
      col="red",
      pch=4,
      cex=2,
      lwd=2
    )
    
  })
}

#povezivanje svega toga
shinyApp(
  ui=ui,
  server=server
)
