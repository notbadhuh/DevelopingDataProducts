shinyUI(pageWithSidebar(
     headerPanel(h1("Monthly Loan Payments",align="center"),head('Monthly Loan Payments')),
     sidebarPanel(
          h3('Loan Information'),
          numericInput(inputId = "P",
                      label = "Loan Principle",
                      value=60000),          
          numericInput(inputId = "r",
                       label = "Loan APR (%)",
                       value=6.5,
                       min=0,
                       max=30,
                       step=0.1),   
          numericInput(inputId = "n",
                       label = "Loan Length (Years)",
                       value=10,
                       min=0,
                       max=35,
                       step=1),
          submitButton("Calculate"),
          br(),
          br(),
          h3('How To Use This App'),
          p("To use this app, just enter your loan information.  This includes the loan principle (the amount you've borrowed), the interest rate given as the APR, and the length of the loan in years (how long you are borrowing for).  Then hit calculate.  It's as simple as that!"),
          br(),
          a('Github Repository',href='https://github.com/notbadhuh/DevelopingDataProducts')
     ),
     mainPanel(
          textOutput('payment'),
          br(),
          textOutput('totalInterestPaid'),
          br(),
          p('The following plot shows the time to pay off the loan if you pay an extra amount (in addition to the calculated payment) towards your loan each month.'),
          plotOutput(outputId = "main_plot", height = "400px"),
          p('The takeaway is that by paying a little extra each month, you can significantly decrease the time it takes to pay off your loan.  This costs you less in interest over time!'),
          p('Note: This assumes there is no', a('prepayment penalty',href="http://www.thetruthaboutmortgage.com/prepayment-penalty-mortgage/"),'to worry about.')
     )
))