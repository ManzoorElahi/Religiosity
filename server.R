library(shiny)
library(RCurl)
shinyServer(function(input, output) {
  
  Reg_data <- read.csv("http://raw.githubusercontent.com/ManzoorElahi/Religiosity/master/R%26A.csv")
  Reg_data <- Reg_data[,1:7] 
  
  iv1 <- NULL
  dv1 <- NULL
  

  
  output$distPlot <- renderPlot({
    
    s <- NULL
    if (length(input$yselc) < 1) {
      s <- 2
    }
    else {
      s <- input$yselc
    }
    
    x <- NULL
    xs <- 1
    if (length(input$xselc) < 1) {
      xs <- 1
    }
    else {
      xs <- as.numeric(input$xselc[1])
    }
    x <- as.numeric(Reg_data[,xs])

    y <- NULL
    
    for (i in 1:length(s)) {
      if (s[i] == 1) {
        y <- cbind(y,Reg_data$Country)
      }
      else if (s[i] == 2) {
        y <- cbind(y,Reg_data$Religious)
      }
      
      else if (s[i] == 3) {
        y <- cbind(y,Reg_data$Not.Religious)
      }
      else if (s[i] == 4) {
        y <- cbind(y,Reg_data$Atheist)
      }
      else if (s[i] == 5) {
        y <- cbind(y,Reg_data$Don.t.Know)
      }
      
      else if (s[i] == 6) {
        y <- cbind(y,Reg_data$PPP)
      }
      else if (s[i] == 7) {
        y <- cbind(y,Reg_data$GDP.Per.Capita)
      }
    }
    
    matplot(x,y, type = 'h')
    })
  output$txo <- renderTable(Reg_data)
  output$ra <- renderTable({
    if (length(input$dv)<1){
      dv1 <- 7
    }
    else {
      dv1 <- input$dv[1]
    }
    
    if (length(input$iv)<1){
      iv1 <- 2
    }
    else {
      iv1 <- input$iv
    }
    
    iv1 <- as.numeric(iv1)
    dv1 <- as.numeric(dv1)
    
    
    fit <- glm(as.numeric(Reg_data[,dv1]) ~ as.numeric(Reg_data[,iv1[1]]))
    if (length(iv1)==7){
      fit <- update(fit, .~. + as.numeric(Reg_data[,iv1[2]]) + as.numeric(Reg_data[,iv1[3]]) + as.numeric(Reg_data[,iv1[4]]) + as.numeric(Reg_data[,iv1[5]]) + as.numeric(Reg_data[,iv1[6]]) + as.numeric(Reg_data[,iv1[7]]))
    }
    else if (length(iv1)==6){
      fit <- update(fit, .~. + as.numeric(Reg_data[,iv1[2]]) + as.numeric(Reg_data[,iv1[3]]) + as.numeric(Reg_data[,iv1[4]]) + as.numeric(Reg_data[,iv1[5]]) + as.numeric(Reg_data[,iv1[6]]))
    }
    else if (length(iv1)==5){
      fit <- update(fit, .~. + as.numeric(Reg_data[,iv1[2]]) + as.numeric(Reg_data[,iv1[3]]) + as.numeric(Reg_data[,iv1[4]]) + as.numeric(Reg_data[,iv1[5]]))
    }
    else if (length(iv1)==4){
      fit <- update(fit, .~. + as.numeric(Reg_data[,iv1[2]]) + as.numeric(Reg_data[,iv1[3]]) + as.numeric(Reg_data[,iv1[4]]))
    }
    else if (length(iv1)==3){
      fit <- update(fit, .~. + as.numeric(Reg_data[,iv1[2]]) + as.numeric(Reg_data[,iv1[3]]))
    }
    else if (length(iv1)==2){
      fit <- update(fit, .~. + as.numeric(Reg_data[,iv1[2]]))
    }
    output$anova1 <- renderTable(anova(fit))
    output$cv <- renderTable(vcov(fit))
    output$rp1 <- renderPlot(qqnorm(resid(fit)))
    output$rp2 <- renderPlot(plot(density((resid(fit)))))
    summary(fit)
    })
  
  
})
