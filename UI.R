library(shiny)

# Define UI for application calculates CVD risk
shinyUI(fluidPage(
    
    # Application title
    titlePanel("10 Year Risk Calculator for Cardiovascular Disease"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons("gender", "Gender:",
                         c("Male" = 1,
                           "Female" = 0),
                         0,
                         TRUE),
            
            sliderInput("age",
                        "Age (years):",
                        min = 30,
                        max = 74,
                        value = 30),
            
            sliderInput("sbp",
                        "Systolic Blood Pressure (mm Hg):",
                        min = 90,
                        max = 200,
                        value = 125),
            
            radioButtons("trtbp", "Treated for Hypertension:",
                         c("Yes" = 1,
                           "No" = 0),
                         0,
                         TRUE),

            radioButtons("smoker", "Current Smoker:",
                         c("Yes" = 1,
                           "No" = 0),
                         0,
                         TRUE),

            radioButtons("diabetes", "Diabetes:",
                         c("Yes" = 1,
                           "No" = 0),
                         0,
                         TRUE),
            
            sliderInput("hdl",
                        "HDL:",
                        min = 10,
                        max = 100,
                        value = 45),
            
            sliderInput("tcl",
                        "Total Cholesterol:",
                        min = 100,
                        max = 405,
                        value = 180),
            
            helpText("Enter the data above from your last physical exam and then click on Calculate Risk",
                      "to see your 10 year risk score"),
            
            submitButton("Calculate Risk")
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            
            h3("Your 10 year risk for cardiovascular disease is:"),
            h3(textOutput("risk", inline=TRUE), "%"),
            helpText("Risk Assessment based on data from the Framingham Heart Study. Cardiovascular disease includes",
                     "coronary death, myocardial infarction, coronary insufficiency, angina, ischemic stroke, ",
                     "hemorrhagic stroke, transient ischemic attack, peripheral artery disease, heart failure")
        )
    )
))
