#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)


# Define UI for application that draws a histogram

header <- dashboardHeader(title="Basic Dashboard")
sidebar <- dashboardSidebar(
        sidebarMenu(
                id = "tabs",
                menuItem("Dashboard", tabName = "dashboard", icon=icon("dashboard")),
                menuItem("Find", tabName="find", icon=icon("search", lib="glyphicon")),
                menuItem("Visit-us", tabName="Visit-us", icon=icon("send", lib="glyphicon")),
                href = "https://www.google.com",
                textOutput("res")
        )
)

frow1 <- fluidRow(
        valueBoxOutput("value1"),
        valueBoxOutput("value2"),
        valueBoxOutput("value3")
)

frow2 <- fluidRow(
        box(
                id = "RevenuePerAccount",
                title = "Revenue per Account",
                status = "primary",
                solidHeader = TRUE,
                collapsible = TRUE,
                plotOutput("revenuebyPrd", height = "300px")
        ),
        box(
                title = "Revenue per Product",
                status = "primary",
                solidHeader = TRUE,
                collapsible = TRUE,
                plotOutput("revenuebyRegion", height = "300px")
        )
        
)

fluid <- fluidPage(
        useShinyjs(),
        
        box(    
                id = "researchInfo",
                radioButtons("radio", label = h3("Search by"),
                     choices = list("Account" = 1, "Product" = 2, "Region" = 3), 
                     selected = 1),
        
                hr(),
                fluidRow(column(3, verbatimTextOutput("value"))),
                
                selectInput("account", label = h3("Account"), 
                            choices = list("Axis Bank", "HSBC", "SBI", "ICICI",
                                           "Bandhan Bank"), 
                            selected = "Axis Bank"),
        
                selectInput("product", label = h3("Product"), 
                            choices = list("FBB", "SIMO"), 
                            selected = "FBB"),
                
                selectInput("region", label = h3("Region"), 
                            choices = list("North", "South", "East", "West"), 
                            selected = "North"),
                actionButton('act1', 'Search')
        ),
        
        box( id = "result",
             title = "Search result",
             status = "primary",
             solidHeader = TRUE,
             callapsible = TRUE,
             DTOutput('tbl'))
)
        
body <-   dashboardBody(
        tabItems(
                tabItem("dashboard", frow1, frow2),
                tabItem("find", fluid),
                tabItem("Visit-us", "Our site")
        )
)


ui <- dashboardPage(title= 'This is my Page title', header, sidebar, body, skin='red')


