shinyServer(function(input, output) {
     library(ggplot2)
     output$payment <- renderText({
          payment <- format(round((input$r/(12*100)*input$P)/(1-(1+input$r/(12*100))^(-input$n*12)),2), nsmall=2)
          paste("Your monthly payments will be $", payment, ".", sep="")
     })
     output$totalInterestPaid <- renderText({
          payment <- round((input$r/(12*100)*input$P)/(1-(1+input$r/(12*100))^(-input$n*12)),2)
          totalInterestPaid <- format(round(payment*(input$n*12)-input$P,2), nsmall=2)
          paste("If you make the normal payments (i.e. you pay no extra), the total interest paid on the loan will be $", totalInterestPaid, ".", sep="")
     })
     output$main_plot <- renderPlot({
          
          extra <- seq(from=0, to=input$P*0.02, by=input$P*0.001)
          timeToPayOffLoan <- numeric()
          payment <- (input$r/(12*100)*input$P)/(1-(1+input$r/(12*100))^(-input$n*12))
          for(i in 1:length(extra)) {
               newPayment <- payment + extra[i]
               timeToPayOffLoan[i] <- (-log(1-(input$r/(12*100)*input$P)/(newPayment))/log(1+input$r/(12*100)))/12
          }
          
          qplot(extra, timeToPayOffLoan, 
                geom=c("point","line"),
                main="Time to Pay Off Loan When Paying Extra", 
                xlab="Extra Paid in Addition to Monthly Payment ($)",
                ylab="Time to Pay Off Loans (Years)",
                ylim=c(0,input$n))
     })
     
     
})