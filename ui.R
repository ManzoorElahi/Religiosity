
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(navbarPage("",
                   tabPanel("Plot",
                            titlePanel("Religiosity"),
                            
                            sidebarLayout(
                              sidebarPanel(
                                checkboxGroupInput("xselc","X-Axis: Select any one option from below:",
                                                   c("Country" = "1",
                                                     "Religious" = "2",
                                                     "Not Religious" = "3",
                                                     "Atheist" = "4",
                                                     "Don't Know" ="5",
                                                     "Purchasing power parity (PPP)" = "6",
                                                     "GDP Per Capita" = "7"
                                                     )),
                                checkboxGroupInput("yselc","Y-Axis: Select atleast one option from below:",
                                                   c("Country" = "1",
                                                     "Religious" = "2",
                                                     "Not Religious" = "3",
                                                     "Atheist" = "4",
                                                     "Don't Know" ="5",
                                                     "Purchasing power parity (PPP)" = "6",
                                                     "GDP Per Capita" = "7"
                                                   ))
                              ),
                            mainPanel("Plot",
                                      plotOutput("distPlot")
                                      )
                            )),
                            
                   tabPanel("Complete Data",
                            titlePanel("Data"),
                            
                            mainPanel(
                                      tableOutput("txo")
                            )
                            ),
                   tabPanel("Analysis",
                            titlePanel("Regression Analysis"),
                            
                            sidebarLayout(
                              sidebarPanel(
                                checkboxGroupInput("dv","Select One Dependent variable:",
                                                   c("Country" = "1",
                                                     "Religious" = "2",
                                                     "Not Religious" = "3",
                                                     "Atheist" = "4",
                                                     "Don't Know" ="5",
                                                     "Purchasing power parity (PPP)" = "6",
                                                     "GDP Per Capita" = "7"
                                                   )),
                                checkboxGroupInput("iv","Select atleast one dependent variable:",
                                                   c("Country" = "1",
                                                     "Religious" = "2",
                                                     "Not Religious" = "3",
                                                     "Atheist" = "4",
                                                     "Don't Know" ="5",
                                                     "Purchasing power parity (PPP)" = "6",
                                                     "GDP Per Capita" = "7"
                                                   ))
                              ),
                              mainPanel("Summary of Generalized Linear Regression Analysis:",
                                        tableOutput("ra"),
                                        "ANOVA:",
                                        tableOutput("anova1"),
                                        "Covariance table for model parameters:",
                                        tableOutput("cv"),
                                        plotOutput("rp1"),
                                        plotOutput("rp2")                                      
                              )
                            )),
                            
                   tabPanel("Documentation",
                            h4("GLOBAL INDEX OF RELIGIOSITY AND ATHEISM"),
                            p("WIN/Gallup International, the world’s leading association in market research and polling, has published its latest data exploring the religious beliefs of 63,898 people from many countries across the globe."),
                            p("The  report published by Win/Gallup can be download here:"),
                            a("http://www.wingia.com/web/files/news/290/file/290.pdf"),
                            br(""),
                            h4("GDP per capita (current US$)"),
                            p("GDP & PPP data was taken from World Bank report. GDP per capita is gross domestic product divided by midyear population. GDP is the sum of gross value added by all resident producers in the economy plus any product taxes and minus any subsidies not included in the value of the products. It is calculated without making deductions for depreciation of fabricated assets or for depletion and degradation of natural resources. Data are in current U.S. dollars.Purchasing power parity conversion factor is the number of units of a country's currency required to buy the same amounts of goods and services in the domestic market as U.S. dollar would buy in the United States."),
                            p("GDP per capita data can be download here:"),
                            a("http://api.worldbank.org/v2/en/indicator/ny.gdp.pcap.cd?downloadformat=csv"),
                            br(""),
                            p("Link for PPP data:"),
                            a("http://api.worldbank.org/v2/en/indicator/pa.nus.ppp?downloadformat=csv"),
                            br(""),
                            h4("Regression Analysis"),
                            p("In statistics, regression analysis is a statistical process for estimating the relationships among variables. It includes many techniques for modeling and analyzing several variables, when the focus is on the relationship between a dependent variable and one or more independent variables.Regression analysis is widely used for prediction and forecasting. If the coefficient of the independent variable is negative then it has a negative effect on dependent variable and the inverse holds true, i.e. if the coefficient is positive, the independent variable has a positive effect on dependent variable."),
                            p("For further reading on Regression analysis:"),
                            a("http://dss.princeton.edu/online_help/analysis/regression_intro.htm"),
                            p(""),
                            a("http://en.wikipedia.org/wiki/Regression_analysis"),
                            p(""),
                            a("http://www.encyclopediaofmath.org/index.php/Regression_analysis"),
                            br(""),
                            h4("Link for the Source code of this Shiny Web App:"),
                            a(""),
                            br(""),
                            br(""),
                            br("")
                        
                            )
))