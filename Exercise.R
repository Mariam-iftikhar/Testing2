--------------------------------------------------Exercise 3--------------------------------------------------------------
  # Importing libraries
  
  library(data.table)
library(xts)
library(quantmod)
library(wooldridge)

  
  ceosal2

# The file CEOSAL2 contains data on 177 chief executive officers and can be used to examine  
# the effects of firm performance on CEO salary.


#  (i) Estimate a model relating annual salary to firm sales and market value. Make the model 
# of the constant elasticity variety for both independent variables. Write the results out 
# in equation form.

#salary = B0 + B1lsales + B2lmktval + U

ceosal2.effect <- lm(salary ~ lsales + lmktval, data =  ceosal2)
summary(ceosal2.effect)

# y.fitted <- mapply(function(a, b) {
#   y.hat <- -862.64 + (95.38 * a) + (140.39 * b)
#   return(y.hat)
# }, ceosal2$lsales, ceosal2$lmktval)

# y.fitted



#  (ii) Add profits to the model from part (i). Why can this variable not be included in logarithmic 
# form? Would you say that these firm performance variables explain most of the variation 
# in CEO salaries?

#salary = B0 + B1lsales + B2lmktval + B3profits + U

ceosal2.effectafterprofits <- lm(salary ~ lsales + lmktval + profits , data =  ceosal2)
summary(ceosal2.effectafterprofits)

# y.fittedafterupdated <- mapply(function(a, b,c) {
#   y.hat <- -571.8192 + (92.0297 * a) + (99.9486  * b) + (0.1571*c)
#   return(y.hat)
# }, ceosal2$lsales, ceosal2$lmktval,ceosal2$profits)

# y.fittedafterupdated

#Explanation:
#Multiple R-squared:  0.2246

# When incorporating profits into the model for CEO salaries, it's important to avoid using logarithmic form 
# if there are any instances of zero or negative profits. Logarithmic transformation cannot be applied to zero or 
# negative values, which can distort the analysis or result in errors. A Multiple R-squared value of 0.2246 indicates 
# that roughly 22.46% of the variation in CEO salaries can be accounted for by the model, which takes into 
# consideration sales, market value, and profits. While this shows a connection between firm performance and CEO 
# salaries, it also reveals that a substantial portion (around 77.54%) of the variation is not explained by these 
# factors.

# This implies that although firm performance is a factor in determining CEO compensation, other elements are likely 
# at play as well, including various non-performance-related criteria.
#  It may be beneficial to look into additional variables to enhance the model's accuracy.




# (iii)  Add the variable ceoten to the model in part (ii). What is the estimated percentage return for  
# another year of CEO tenure, holding other factors fixed?

#salary = B0 + B1lsales + B2lmktval + B3profits + B4ceoten + U

ceosal2.effectafterceoten <- lm(salary ~ lsales + lmktval + profits + ceoten , data =  ceosal2)
summary(ceosal2.effectafterceoten)

estimatedpercentagereturn <- -719.4013 + (93.0189 * 0) + (104.7839  * 0) + (0.1496*0) + (13.3529* 1)
estimatedpercentagereturn

#Explanation: 
#For every additonal year of CEO tenure the estimated percentage return is 13,3529 dollars

# y.fittedafterceoten <- mapply(function(a, b,c,d) {
#   y.hat <- -719.4013 + (93.0189 * a) + (104.7839  * b) + (0.1496*c) + (13.3529* d)
#   return(y.hat)
# }, ceosal2$lsales, ceosal2$lmktval,ceosal2$profits,ceosal2$ceoten)

# y.fittedafterceoten
