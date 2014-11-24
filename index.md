---
title       : Loan Payment Calculator
subtitle    : Calculating Monthly Payments and Looking at the Effect of Extra Payments
author      : Brandon    
job         : 
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

# Loan Payment Calculator
## Calculating Monthly Payments and Looking at the Effect of Extra Payments

### Brandon
### November 23, 2014

---

## What is it?

* A monthly payment calculator for loans
* A means to see how much you'll pay in interest over the course of your loan
* A visual tool to illustrate the importance of making extra payments on your loan

--- 

## What does it specifically do?

* Enter you loan information
  * Principle
  * Interest rate (APR)
  * Length of loan (years)
* Hit "Calculate"
* Get back relevant information
  * Monthly loan payment
  * Total interest paid over the course of the loan
  * A plot showing how making extra payments reduces the time you pay on the loan

---

## Why is it necessary?

* Help consumers make more informed financial decisions
* Easily illustrate the effects of making extra payments on your loan
* Determine estimated monthly payments on your loan

---

## How does it do it?

* Use <a href="http://www.financeformulas.net/Loan_Payment_Formula.html">a finacial formula</a> to calculate the estimated monthly payment.
* Calculate the number of payments made over the course of the loan.
* Subtract the principle from the total amount paid to get the total interest paid.
* Calculate the time taken to pay off the loan when making various extra payments.
* Plot the time taken to pay off the loan vs. the extra payment.

---

## A sample of the code

Calculate the monthly payment:


```r
P <- 60000; r <- 6.5; n <- 10
payment <- format(round((r/(12*100)*P)/(1-(1+r/(12*100))^(-n*12)),2), nsmall=2)
print(paste("Your monthly payments will be $", payment, ".", sep=""))
```

```
## [1] "Your monthly payments will be $681.29."
```

Calculate the total interest paid over the course of the loan:


```r
P <- 60000; r <- 6.5; n <- 10
payment <- round((r/(12*100)*P)/(1-(1+r/(12*100))^(-n*12)),2)
totalInterestPaid <- format(round(payment*(n*12)-P,2), nsmall=2)
print(paste("If you make the normal payments (i.e. you pay no extra), the total interest paid on the loan will be $", totalInterestPaid, ".", sep=""))
```

```
## [1] "If you make the normal payments (i.e. you pay no extra), the total interest paid on the loan will be $21754.80."
```


---

## Where do we go from here?

* Get more publicity for the app
* Use this as a jumping off point for a discussion of financial literacy
