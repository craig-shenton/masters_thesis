Logistic Models
========================================================



```r
omnr.glm <- data.frame(zone = rep(c("mea", "int"), c(16, 16)), year = rep(1989:2004, 
    2), suppressed = c(49, 10, 52, 28, 5, 34, 58, 33, 21, 23, 12, 6, 6, 11, 
    10, 1, 137, 83, 12, 79, 42, 93, 199, 89, 73, 150, 83, 57, 101, 38, 77, 16), 
    unsuppressed = c(7, 0, 14, 2, 2, 4, 26, 27, 6, 4, 6, 0, 2, 6, 6, 0, 7, 5, 
        8, 7, 1, 1, 27, 54, 5, 15, 12, 1, 0, 10, 10, 1))
```






```r
show(omnr.glm)
```



```
##    zone year suppressed unsuppressed
## 1   mea 1989         49            7
## 2   mea 1990         10            0
## 3   mea 1991         52           14
## 4   mea 1992         28            2
## 5   mea 1993          5            2
## 6   mea 1994         34            4
## 7   mea 1995         58           26
## 8   mea 1996         33           27
## 9   mea 1997         21            6
## 10  mea 1998         23            4
## 11  mea 1999         12            6
## 12  mea 2000          6            0
## 13  mea 2001          6            2
## 14  mea 2002         11            6
## 15  mea 2003         10            6
## 16  mea 2004          1            0
## 17  int 1989        137            7
## 18  int 1990         83            5
## 19  int 1991         12            8
## 20  int 1992         79            7
## 21  int 1993         42            1
## 22  int 1994         93            1
## 23  int 1995        199           27
## 24  int 1996         89           54
## 25  int 1997         73            5
## 26  int 1998        150           15
## 27  int 1999         83           12
## 28  int 2000         57            1
## 29  int 2001        101            0
## 30  int 2002         38           10
## 31  int 2003         77           10
## 32  int 2004         16            1
```







```r
glm.eq0 <- "cbind(suppressed, unsuppressed) ~ year"

glm.eq1 <- "cbind(omnr.glm$suppressed, omnr.glm$unsuppressed) ~ omnr.glm$year"

glm.eq2 <- "cbind(omnr.glm$suppressed, omnr.glm$unsuppressed) ~ omnr.glm$zone * omnr.glm$year"

glm.out <- glm(glm.eq0, family = binomial(logit), data = omnr.glm)
```






```r
summary(glm.out)
```



```
## 
## Call:
## glm(formula = glm.eq0, family = binomial(logit), data = omnr.glm)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -6.996  -1.290   0.625   1.767   5.840  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)
## (Intercept)  46.7287    31.8531    1.47     0.14
## year         -0.0225     0.0160   -1.41     0.16
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 238.46  on 31  degrees of freedom
## Residual deviance: 236.47  on 30  degrees of freedom
## AIC: 336.8
## 
## Number of Fisher Scoring iterations: 5
## 
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
##      Df Deviance Resid. Df Resid. Dev Pr(>Chi)
## NULL                    31        238         
## year  1     1.99        30        236     0.16
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



