Zone and Ecoregion
========================================================



```r
omnr.glm <- data.frame(zone = rep(c("mea", "int"), c(3, 3)), ecoregion = rep(c("E3", 
    "W3", "S3")), suppressed = c(60, 194, 111, 152, 91, 44), unsuppressed = c(20, 
    67, 19, 20, 43, 10))

glm.eq <- "cbind(suppressed, unsuppressed) ~ zone * ecoregion"

glm.out <- glm(glm.eq, family = binomial(logit), data = omnr.glm)

summary(glm.out)
```



```
## 
## Call:
## glm(formula = glm.eq, family = binomial(logit), data = omnr.glm)
## 
## Deviance Residuals: 
## [1]  0  0  0  0  0  0
## 
## Coefficients:
##                     Estimate Std. Error z value Pr(>|z|)    
## (Intercept)            2.028      0.238    8.53  < 2e-16 ***
## zonemea               -0.930      0.351   -2.65   0.0081 ** 
## ecoregionS3           -0.547      0.423   -1.29   0.1968    
## ecoregionW3           -1.278      0.301   -4.24  2.2e-05 ***
## zonemea:ecoregionS3    1.213      0.555    2.19   0.0287 *  
## zonemea:ecoregionW3    1.243      0.421    2.95   0.0032 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 2.6918e+01  on 5  degrees of freedom
## Residual deviance: 4.6185e-14  on 0  degrees of freedom
## AIC: 40.82
## 
## Number of Fisher Scoring iterations: 3
## 
```






```r
exp(-0.93)  # antilog of the zone/mea coefficient
```



```
## [1] 0.3946
```



```r
# This shows that measured zone was at a significant disadvantage when
# ecoregion and the interaction are controlled.
```






```r
1/exp(-1.0521)
```



```
## [1] 2.864
```



```r
# All else being equal, the odds of a fire in the intensive zone being
# suppressed were 2.86 times the odds of a fire in the measured zone being
# suppressed.
```






```r
anova(glm.out, test = "Chisq")
```



```
## Analysis of Deviance Table
## 
## Model: binomial, link: logit
## 
## Response: cbind(suppressed, unsuppressed)
## 
## Terms added sequentially (first to last)
## 
## 
##                Df Deviance Resid. Df Resid. Dev Pr(>Chi)    
## NULL                               5      26.92             
## zone            1     0.60         4      26.32  0.43809    
## ecoregion       2    17.19         2       9.12  0.00018 ***
## zone:ecoregion  2     9.12         0       0.00  0.01044 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
```






```r
print(sessionInfo(), locale = FALSE)
```



```
## R version 2.15.0 (2012-03-30)
## Platform: x86_64-apple-darwin9.8.0/x86_64 (64-bit)
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] knitr_0.5
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.9.10     codetools_0.2-8 digest_0.5.2    evaluate_0.4.2 
##  [5] formatR_0.4     highlight_0.3.1 parser_0.0-14   plyr_1.7.1     
##  [9] stringr_0.6     tools_2.15.0   
```



