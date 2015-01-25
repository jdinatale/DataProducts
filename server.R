library(shiny)

calcRisk <- function(data, gender, trtbp){
    if (trtbp == "1" ){
        sbpf <- 2.82263
        sbpm <- 1.99881
    } 
    else {
        sbpf <- 2.76157
        sbpm <- 1.93303        
    }
    
    if (gender == "1"){
        coeffs <- c(3.06117, sbpm, 1.1237, -0.93262, 0.65451, 0.57367, -23.982)
        risk <- 1-(0.88936^(exp(sum(data*coeffs))))
    }
    else {
        coeffs <- c(2.32888, sbpf, 1.20904, -0.70833, 0.52873, 0.69154, -26.1931)        
        risk <- 1-(0.95012^(exp(sum(data*coeffs))))    
    }
return(risk)
}


# Define server logic required to calculate risk
shinyServer(function(input, output) {
    
    data <- reactive({c(log(input$age), log(input$sbp), log(input$tcl), log(input$hdl), as.numeric(input$smoker), as.numeric(input$diabetes), 1)})
    output$risk <- renderText({round(calcRisk(data(), input$gender, input$trtbp)*100, 1)})
})