library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(shinyjs)

# load data
recommendation <- read.csv(file="recommendation.csv",
                           header = TRUE, stringsAsFactors = FALSE)
str(recommendation)

# server function 
shinyServer(function(input, output, session) {
        # some data manipulation to derive the values of KPI boxes
        total.revenue <- sum(recommendation$Revenue)
        sales.account <- recommendation %>% group_by(Account) %>% 
                summarise(value=sum(Revenue)) %>% filter(value==max(value))
        prof.prod <- recommendation %>% group_by(Product) %>%
                summarise(value=sum(Revenue)) %>% filter(value==max(value))
        
        # creating the valueBoxOutput content
        output$value1 <- renderValueBox({
                valueBox(
                formatC(sales.account$value, format="d", big.mark=','),
                        paste('Top Account:',  sales.account$Account),
                        icon=icon("stats", lib='glyphicon'),
                        color = "purple")
        })
        
        output$value2 <- renderValueBox({
                valueBox(
                        formatC(total.revenue, format="d", big.mark=','),
                        'Total Expected Revenue',
                        icon = icon("gbp", lib='glyphicon'),
                        color = "green"
                )
        })

        output$value3 <- renderValueBox({
                valueBox(
                        formatC(prof.prod$value, format="d", big.mark=','),
                        paste('Top Product:', prof.prod$Product),
                        icon = icon("menu-hamburger", lib='glyphicon'),
                        color = "yellow"
                )
        })
        # creating the plotOutput content
        output$revenuebyPrd <- renderPlot({
                ggplot(data = recommendation, aes(x=Product, y=Revenue,
                                                  fill=factor(Region))) + 
                        geom_bar(position = "dodge", stat = "identity") + 
                        ylab("Revenue (in Euros)") +
                        xlab("Product") + theme(legend.position="bottom",
                                                plot.title=element_text(size=15,
                                                                        face="bold"))+
                        ggtitle("Revenue by Product") + labs(fill="Region")
        })
        output$revenuebyRegion <- renderPlot({
                ggplot(data = recommendation, 
                       aes(x=Account, y= Revenue, fill=factor(Region))) +
                        geom_bar(position = "dodge", stat="identity") +
                        ylab("Revenue (in Euros)") + 
                        xlab("Account") + theme(legend.position="bottom", 
                                                plot.title = element_text(size=15,
                                                                          face="bold"))+
                        ggtitle("Revenue by Region") + labs(fill = "Region")

        })
        
        output$res <- renderText({
                paste("You've selected:", input$tabs)
        })
        
        
        observeEvent(input$tabs,{
                
                
                if(input$tabs == 'find'){
                        reset("researchInfo")
                        reset("account")
                        reset("product")
                        
                        observeEvent(input$radio,{
                        
                        if(input$radio==1){
                                show(id="account")
                                hide(id="product")
                                hide(id="region")
                        }
                                
                        if(input$radio==2){
                                hide(id="account")
                                show(id="product")
                                hide(id="region")
                        }
                                
                        if(input$radio==3){
                                hide(id="account")
                                hide(id="product")
                                show(id="region")
                        }
                        })
                        
                        # do the search and display result when action button is clicked        
                        observeEvent(input$act1, {
                                
                                if(input$radio==1){
                                        data_subset <- filter(recommendation, Account==input$account)
                                }
                                if(input$radio==2){
                                        data_subset <- filter(recommendation, Product==input$product)
                                }
                                if(input$radio==3){
                                        data_subset <- filter(recommendation, Region==input$region)
                                }
                                
                                output$tbl <- renderDT(data_subset, options = list(dom = 't'))
                                
                        })
               
                }
        })
})
       
