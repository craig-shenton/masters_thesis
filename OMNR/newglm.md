Zone and Ecoregion
========================================================


```r
omnr.glm <- data.frame(zone = rep(c("mea", "int"), c(3, 3)), ecoregion = rep(c("E3", 
    "W3", "S3")), suppressed = c(60, 194, 111, 152, 91, 44), unsuppressed = c(20, 
    67, 19, 20, 43, 10))

omnr.glm
```

```
##   zone ecoregion suppressed unsuppressed
## 1  mea        E3         60           20
## 2  mea        W3        194           67
## 3  mea        S3        111           19
## 4  int        E3        152           20
## 5  int        W3         91           43
## 6  int        S3         44           10
```

```r

glm.eq <- "cbind(suppressed, unsuppressed) ~ zone + ecoregion"

glm.out <- glm(glm.eq, family = binomial(logit), data = omnr.glm)

summary(glm.out)
```

```
## 
## Call:
## glm(formula = glm.eq, family = binomial(logit), data = omnr.glm)
## 
## Deviance Residuals: 
##      1       2       3       4       5       6  
## -2.085   0.802   0.367   1.580  -1.095  -0.552  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  1.66907    0.18186    9.18  < 2e-16 ***
## zonemea     -0.00428    0.18216   -0.02  0.98127    
## ecoregionS3  0.01009    0.27509    0.04  0.97075    
## ecoregionW3 -0.71423    0.21499   -3.32  0.00089 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 26.9180  on 5  degrees of freedom
## Residual deviance:  9.1249  on 2  degrees of freedom
## AIC: 45.95
## 
## Number of Fisher Scoring iterations: 4
## 
```



```r
exp(-0.946418)  # antilog of the zone/mea coefficient
```

```
## [1] 0.3881
```

```r
# This shows that measured zone was at a significant disadvantage when
# ecoregion and the interaction are controlled.
```



```r
1/exp(-0.71423)
```

```
## [1] 2.043
```

```r
# All else being equal, the odds of a fire in the intensive zone being
# suppressed were 2 times the odds of a fire in the measured zone being
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
##           Df Deviance Resid. Df Resid. Dev Pr(>Chi)    
## NULL                          5      26.92             
## zone       1      0.6         4      26.32  0.43809    
## ecoregion  2     17.2         2       9.12  0.00018 ***
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
## [1] knitr_0.7
## 
## loaded via a namespace (and not attached):
## [1] digest_0.5.2   evaluate_0.4.2 formatR_0.6    plyr_1.7.1    
## [5] stringr_0.6    tools_2.15.0  
```

