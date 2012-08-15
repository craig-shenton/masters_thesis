Calculations
========================================================

Calculating the area burned per year & the number of arrivals (i.e., new fires) per year


```r
omnr <- read.csv("OMNR_data.csv", header = TRUE)

# create subset omnr.clean == only fires in the Intensive and Measured
# Zones & caused by Lightening
omnr.clean <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE == "MEA"))

omnr.3E <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 48 & omnr.clean$LATITUDE <= 
    51) & (omnr.clean$LONGITUDE <= -80 & omnr.clean$LONGITUDE >= -86))

omnr.3W <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 48 & omnr.clean$LATITUDE <= 
    51) & (omnr.clean$LONGITUDE <= -88 & omnr.clean$LONGITUDE >= -92))

omnr.3S <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 51 & omnr.clean$LATITUDE <= 
    53) & (omnr.clean$LONGITUDE <= -88 & omnr.clean$LONGITUDE >= -96))

omnr.total <- rbind(omnr.3E, omnr.3W, omnr.3S)


A <- sum(omnr.total$FINAL_SIZE)

A
```

```
## [1] 329301
```

```r

# area burned per year
At <- aggregate(omnr.total$FINAL_SIZE, by = list(omnr.total$FIRE_YEAR), sum)

# rename columns
names(At) <- c("Year", "Area (ha)")

At
```

```
##    Year Area (ha)
## 1  1989   16569.3
## 2  1990     279.2
## 3  1991   16232.1
## 4  1992     847.7
## 5  1993   18272.2
## 6  1994    1529.9
## 7  1995   98735.6
## 8  1996   78395.8
## 9  1997    7047.8
## 10 1998    9112.1
## 11 1999   12944.3
## 12 2000     131.0
## 13 2001     716.4
## 14 2002    3438.2
## 15 2003   65033.0
## 16 2004      16.8
```

```r

# number of arivals per year
Nt <- aggregate(omnr.total$FINAL_SIZE, by = list(omnr.total$FIRE_YEAR), length)

# rename columns
names(Nt) <- c("Year", "Fires")

Nt
```

```
##    Year Fires
## 1  1989   232
## 2  1990    85
## 3  1991   246
## 4  1992    87
## 5  1993    51
## 6  1994   104
## 7  1995   199
## 8  1996   139
## 9  1997   118
## 10 1998   141
## 11 1999    39
## 12 2000    17
## 13 2001    60
## 14 2002    69
## 15 2003    45
## 16 2004    11
```

```r

N <- sum(Nt$Fires)

N
```

```
## [1] 1643
```

```r

omnr.small <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 3)

small <- aggregate(omnr.small$FINAL_SIZE, by = list(omnr.small$FIRE_YEAR), length)

names(small) <- c("Year", "Fires")

small <- sum(small$Fires)

small
```

```
## [1] 1272
```

```r

percent.small <- (small/N) * 100

percent.small
```

```
## [1] 77.42
```

```r

omnr.big <- subset(omnr.total, subset = omnr.total$FINAL_SIZE > 200)

big <- aggregate(omnr.big$FINAL_SIZE, by = list(omnr.big$FIRE_YEAR), length)

names(big) <- c("Year", "Fires")

big <- sum(big$Fires)

big
```

```
## [1] 81
```

```r

percent.big <- (big/N) * 100

percent.big
```

```
## [1] 4.93
```

```r

suppressed <- N - (big + small)

suppressed
```

```
## [1] 290
```

```r

percent.suppressed <- (suppressed/N) * 100

percent.suppressed
```

```
## [1] 17.65
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

