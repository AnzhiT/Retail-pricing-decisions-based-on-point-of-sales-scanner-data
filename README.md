# Retail-pricing-decisions-based-on-point-of-sales-scanner-data
## Executive Summary

The aim of the project is to identify the factors that will have an influence on sales and find the optimal price for Nick’s Grocery. Regression analysis is carried out and Semi-Log model is chosen to evaluate the relationships among the various factors and sales, and then the optimal price is calculated. From the perspective of both statistic and real-world experience, it is recommended that Nick’s Grocery adopts $3.19 as the optimal retail price for Tropicana 64 ounces in the 105th week. This would help them increase gross profit by 33.1%.

ropicana 64 in the 105th week using a best fitting pricing model.
 
## Data and Methodology
 
A dataset named Tropic which has 1560 observations for a period of 105 weeks (2 years) across 15 stores (2, 14, 32, 52, 62, 68, 71, 72, 93, 95, 111, 123, 124, 130, 137) has been provided. Nick’s Grocery stores initially made pricing recommendations at the chain level, but now the retailer wants to standardize the price of the same item sold in all 15 stores in order to achieve a more uniform price image. The current wholesale price for Tropicana 64 oz. is fixed around $2.57 per bottle. The retailer wants to maximize the gross profit of Tropicana 64 oz. Therefore, to achieve this objective, it is necessary to analyze the effect of the different variables on Sales.
 
The dataset was run through SAS software. In addition to the price, week, store and deal variables, few other variables were created. The performance in each quarter was analyzed by creating dummy variables Qrt 1, Qrt 2 and Qrt 3 with the fourth quarter being the baseline model. Similarly, the codes of the Stores have been converted into dummy variables to capture their effects in the model. (‘2’- Store 1; ‘14’ - Store 2) (Refer Appendix I for dummy variables).  Also, one of the strategies that retailers frequently adopt is using prices ending with 9 to create a perception of being cheap. This factor has been captured in the model using the End9 variable.
 
In order to identify the optimal retail price for Tropicana 64 oz. it is necessary to run a regression analysis to capture the effects of different variables on Sales. The following three regression analysis were carried out: Linear, Semi-Log, and Log-Log. Based on the goodness of fit (R2 value, Adjusted R2 value), the relationship between the residual and predicted value, the distribution of residual value (normal distribution or skewed) the best fit among the three models is chosen (Refer Appendix V for the regression models).
                                                                                                                                                             
The linear model is rejected because of the negative non-linear relationship between residual and predicted value, skewed distribution of the residual and poor goodness of fit (Adjusted R2=0.195). Both the Log-Log model and the Semi-Log model have an ideal relationship between the residual and predicted value and a normally distributed residual value(refer to Table V REG result). Based on the goodness of fit, Semi-Log model (R2=0.48) seems to be slightly better than Log-Log model (R2= 0.46) and the price elasticity of the   Semi-log model varies with the price (b*Pt), which fits the real world business better than the constant price elasticity (b) in Log-log model. Thereby, Semi-Log model is chosen for evaluating the optimal price.
 
 
 
## Key Findings
 
Based on the weekly sales dataset of 15 Nick’s Grocery stores, the results show that Tropicana 64 ounces is sold from $2.74 to $4.18, which averaged about $3.6 from 2009 to 2010 and weekly sales volume averaged about 40914.54 ounces, with a range between 2112 ounces (store 71 week 33) and 1186496 ounces (store 71 week 58). Since the wholesale list price is expected to stay at $2.57 per bottle, the most profitable pricing in the past 2 years was $3.09 in store 71 week 58, which also brought the largest sales volume(1186496 ounces) without deal. And the least profitable pricing was $3.24 in store 14 week 88th, at which the store sold 2304 ounces with deal. What’s more, the sales and price have no significant differences among stores and weeks. Details of descriptive statistics are shown in Appendix I&II. Clearly, either price, sales volume or deal is not the only determinant of profit. Semi-log model is then used to explore the effects of each of these variables.
 
The pricing model is as follow:
Ln Sales=α +store1*β(store1)+store2*β(store2)+store3*β(store3)+store4*β(store4)+store5*β(store5)     
         +store6*β(store6)+ store7*β(store7)+ store8*β(store8) +store9*β(store9)+ store10*β(store10)
         + store11*β(store11)+ store12*β(store12)+ store13*β(store13)+ store14*β(store14)+
         +price* β (price)+deal* β (deal)+end9* β (end9)+week* β (week)
         +qrt1* β (qrt1) + qrt2* β (qrt2) +qrt3* β (qrt3)
where α is the intercept, store15 and qrt4 are baselines. The parameter estimates are shown in IV Model Description.

The REG Procedure output result (refer to Appendix.III. Correlation Result ) shows that the p-value of all the variables is less than 5%, which indicates that all the variables are statistically significant and have varying degrees of contribution to sales volume. After thorough analysis of the results, the following key findings are inferred:
•	Sales volume has a negative linear relation with price in a parameter of -1.536, which means whenever price increases by 1 unit, sales volume will decrease by 78.4% (e-1.536-1)*. 
•	Sales volume has a positive linear relation with price ending with 9 in a parameter of 0.187, which means whenever price ends with 9, increase by 1 unit results in increase of sales volume by 20.6% (e0.187-1)*.
•	Sales volume has a positive linear relation with in-store display and/or feature advertising in a parameter of 0.081, which means whenever in-store display and/or feature advertising happens,  sales volume will increase by 8.4% (e0.081-1)*.
*Rate= (New Sales-Old Sales)/Old Sales
 
In theory, according to semi-log model optimal price formula (P*=Ct-1/b), the optimal retail price for Tropicana orange juice in week 105 should be $3.22. However, considering price ending with 9 has a significantly positive impact on sales volume, the adjusted optimal price should either be $3.19 or $3.29.
 
According to profit analysis (refer to Appendix VI Profit Analysis), when retail price is $3.19, Nick’s Grocery will obtain a gross profit of $11,049 and a growth rate of 33.1%; when retail price is $3.29, its gross profit will be $11,003 and its growth rate will be 32.5%. As the result, $3.19 should be the best retail price for Nick’s Grocery to reach the maximum profit of $11,049 and growth rate of 33.1%.
 
