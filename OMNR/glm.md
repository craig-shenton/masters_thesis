Year = not significant
========================================================


```r
omnr.glm <- data.frame(zone = rep(c("mea", "int"), c(16, 16)), year = rep(1989:2004, 
    2), suppressed = c(49, 10, 52, 28, 5, 34, 58, 33, 21, 23, 12, 6, 6, 11, 
    10, 1, 137, 83, 12, 79, 42, 93, 199, 89, 73, 150, 83, 57, 101, 38, 77, 16), 
    unsuppressed = c(7, 0, 14, 2, 2, 4, 26, 27, 6, 4, 6, 0, 2, 6, 6, 0, 7, 5, 
        8, 7, 1, 1, 27, 54, 5, 15, 12, 1, 0, 10, 10, 1), load = c(2429, 1614, 
        2559, 960, 743, 1053, 2122, 1245, 1634, 2278, 1017, 644, 1561, 1138, 
        1036, 428, 2429, 1614, 2559, 960, 743, 1053, 2122, 1245, 1634, 2278, 
        1017, 644, 1561, 1138, 1036, 428))
```




```r
show(omnr.glm)
```

```
##    zone year suppressed unsuppressed load
## 1   mea 1989         49            7 2429
## 2   mea 1990         10            0 1614
## 3   mea 1991         52           14 2559
## 4   mea 1992         28            2  960
## 5   mea 1993          5            2  743
## 6   mea 1994         34            4 1053
## 7   mea 1995         58           26 2122
## 8   mea 1996         33           27 1245
## 9   mea 1997         21            6 1634
## 10  mea 1998         23            4 2278
## 11  mea 1999         12            6 1017
## 12  mea 2000          6            0  644
## 13  mea 2001          6            2 1561
## 14  mea 2002         11            6 1138
## 15  mea 2003         10            6 1036
## 16  mea 2004          1            0  428
## 17  int 1989        137            7 2429
## 18  int 1990         83            5 1614
## 19  int 1991         12            8 2559
## 20  int 1992         79            7  960
## 21  int 1993         42            1  743
## 22  int 1994         93            1 1053
## 23  int 1995        199           27 2122
## 24  int 1996         89           54 1245
## 25  int 1997         73            5 1634
## 26  int 1998        150           15 2278
## 27  int 1999         83           12 1017
## 28  int 2000         57            1  644
## 29  int 2001        101            0 1561
## 30  int 2002         38           10 1138
## 31  int 2003         77           10 1036
## 32  int 2004         16            1  428
```




```r
glm.eq <- "cbind(suppressed, unsuppressed) ~ zone + load"

glm.out <- glm(glm.eq, family = binomial(logit), data = omnr.glm)
```



```r
summary(glm.out)
```

```
## 
## Call:
## glm(formula = glm.eq, family = binomial(logit), data = omnr.glm)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -8.184  -0.749   0.641   1.997   4.850  
## 
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  1.920955   0.189467   10.14  < 2e-16 ***
## zonemea     -0.946418   0.137669   -6.87  6.2e-12 ***
## load         0.000109   0.000110    1.00     0.32    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 238.46  on 31  degrees of freedom
## Residual deviance: 193.44  on 29  degrees of freedom
## AIC: 295.8
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
## zone  1       44        30        194  3.2e-11 ***
## load  1        1        29        193     0.32    
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

