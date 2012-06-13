Calculations
========================================================

Calculating the area burned per year & the number of arrivals (i.e., new fires) per year



```r
omnr <- read.csv("OMNR_data.csv", header = TRUE)

# create subset omnr.clean == only fires in the Intensive and Measured
# Zones & caused by Lightening
omnr.clean <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE == "MEA" | 
    omnr$FIRE_MGT_ZONE == "INT") & omnr$GENERAL_CAUSE == "LTG")

# area burned per year
At <- aggregate(omnr.clean$FINAL_SIZE, by = list(omnr.clean$FIRE_YEAR), 
    sum)

# rename columns
names(At) <- c("Year", "Area (ha)")

At
```



```
##    Year Area (ha)
## 1  1989   21965.0
## 2  1990     631.7
## 3  1991   42800.4
## 4  1992    9078.1
## 5  1993   15406.7
## 6  1994    2134.8
## 7  1995  169334.3
## 8  1996  300230.8
## 9  1997   31936.5
## 10 1998   44514.9
## 11 1999    8441.2
## 12 2000     289.9
## 13 2001    2068.2
## 14 2002   52807.8
## 15 2003  126679.5
## 16 2004      67.0
```



```r

# number of arivals per year
Nt <- aggregate(omnr.clean$FINAL_SIZE, by = list(omnr.clean$FIRE_YEAR), 
    length)

# rename columns
names(Nt) <- c("Year", "Arrivals")

Nt
```



```
##    Year Arrivals
## 1  1989      986
## 2  1990      523
## 3  1991     1169
## 4  1992      219
## 5  1993      134
## 6  1994      255
## 7  1995     1000
## 8  1996      516
## 9  1997      632
## 10 1998     1260
## 11 1999      322
## 12 2000      176
## 13 2001      950
## 14 2002      590
## 15 2003      461
## 16 2004      102
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



