Title
========================================================



```r

## Transform and clean omnr dataset

omnr <- read.csv("~/Dropbox/Masters/m_thesis/OMNR/OMNR_data.csv")

# exclude fires in the extensive zone

omnr.clean <- subset(omnr, subset = omnr$FIRE_MGT_ZONE == "MEA" | 
    omnr$FIRE_MGT_ZONE == "INT")

omnr.3E <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 48 & 
    omnr.clean$LATITUDE <= 51) & (omnr.clean$LONGITUDE <= -80 & omnr.clean$LONGITUDE >= 
    -86))

omnr.3W <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 48 & 
    omnr.clean$LATITUDE <= 51) & (omnr.clean$LONGITUDE <= -88 & omnr.clean$LONGITUDE >= 
    -92))

omnr.3S <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 51 & 
    omnr.clean$LATITUDE <= 53) & (omnr.clean$LONGITUDE <= -88 & omnr.clean$LONGITUDE >= 
    -96))

## Calculate number of suppressed and unsupressed fires in both Mesured
## and Intensive zones, per ecoregion.

## Ecoregion 3W

# Number of suppressed fires in ecoregion 3W, Measured zone.

omnr.3W.mea.s <- subset(omnr.3W, subset = (omnr.3W$FIRE_MGT_ZONE == 
    "MEA" & omnr.3W$FINAL_SIZE > 3 & omnr.3W$FINAL_SIZE < 200))

# Number of unsuppressed fires in ecoregion 3W, Measured zone.

omnr.3W.mea.e <- subset(omnr.3W, subset = (omnr.3W$FIRE_MGT_ZONE == 
    "MEA" & omnr.3W$FINAL_SIZE > 200))

# Number of suppressed fires in ecoregion 3W, Intensive zone.

omnr.3W.int.s <- subset(omnr.3W, subset = (omnr.3W$FIRE_MGT_ZONE == 
    "INT" & omnr.3W$FINAL_SIZE > 3 & omnr.3W$FINAL_SIZE < 200))

# Number of unsuppressed fires in ecoregion 3W, Intensive zone.

omnr.3W.int.e <- subset(omnr.3W, subset = (omnr.3W$FIRE_MGT_ZONE == 
    "INT" & omnr.3W$FINAL_SIZE > 200))

## Ecoregion 3E

# Number of suppressed fires in ecoregion 3E, Measured zone.

omnr.3E.mea.s <- subset(omnr.3E, subset = (omnr.3E$FIRE_MGT_ZONE == 
    "MEA" & omnr.3E$FINAL_SIZE > 3 & omnr.3E$FINAL_SIZE < 200))

# Number of unsuppressed fires in ecoregion 3E, Measured zone.

omnr.3E.mea.e <- subset(omnr.3E, subset = (omnr.3E$FIRE_MGT_ZONE == 
    "MEA" & omnr.3E$FINAL_SIZE > 200))

# Number of suppressed fires in ecoregion 3E, Intensive zone.

omnr.3E.int.s <- subset(omnr.3E, subset = (omnr.3E$FIRE_MGT_ZONE == 
    "INT" & omnr.3E$FINAL_SIZE > 3 & omnr.3E$FINAL_SIZE < 200))

# Number of unsuppressed fires in ecoregion 3E, Intensive zone.

omnr.3E.int.e <- subset(omnr.3E, subset = (omnr.3E$FIRE_MGT_ZONE == 
    "INT" & omnr.3E$FINAL_SIZE > 200))

## Ecoregion 3S

# Number of suppressed fires in ecoregion 3S, Measured zone.

omnr.3S.mea.s <- subset(omnr.3S, subset = (omnr.3S$FIRE_MGT_ZONE == 
    "MEA" & omnr.3S$FINAL_SIZE > 3 & omnr.3S$FINAL_SIZE < 200))

# Number of unsuppressed fires in ecoregion 3S, Measured zone.

omnr.3S.mea.e <- subset(omnr.3S, subset = (omnr.3S$FIRE_MGT_ZONE == 
    "MEA" & omnr.3S$FINAL_SIZE > 200))

# Number of suppressed fires in ecoregion 3S, Intensive zone.

omnr.3S.int.s <- subset(omnr.3S, subset = (omnr.3S$FIRE_MGT_ZONE == 
    "INT" & omnr.3S$FINAL_SIZE > 3 & omnr.3S$FINAL_SIZE < 200))

# Number of unsuppressed fires in ecoregion 3S, Intensive zone.

omnr.3S.int.e <- subset(omnr.3S, subset = (omnr.3S$FIRE_MGT_ZONE == 
    "INT" & omnr.3S$FINAL_SIZE > 200))

## Calculate values for Ne an Ns

# Ecoregion 3W

omnr.3W.mea.Ne <- aggregate(omnr.3W.mea.e$FINAL_SIZE ~ omnr.3W.mea.e$FIRE_YEAR, 
    data = omnr.3W.mea.e, FUN = length)

omnr.3W.mea.Ns <- aggregate(omnr.3W.mea.s$FINAL_SIZE ~ omnr.3W.mea.s$FIRE_YEAR, 
    data = omnr.3W.mea.s, FUN = length)

omnr.3W.int.Ne <- aggregate(omnr.3W.int.e$FINAL_SIZE ~ omnr.3W.int.e$FIRE_YEAR, 
    data = omnr.3W.int.e, FUN = length)

omnr.3W.int.Ns <- aggregate(omnr.3W.int.s$FINAL_SIZE ~ omnr.3W.int.s$FIRE_YEAR, 
    data = omnr.3W.int.s, FUN = length)

# Ecoregion 3E

omnr.3E.mea.Ne <- aggregate(omnr.3E.mea.e$FINAL_SIZE ~ omnr.3E.mea.e$FIRE_YEAR, 
    data = omnr.3E.mea.e, FUN = length)

omnr.3E.mea.Ns <- aggregate(omnr.3E.mea.s$FINAL_SIZE ~ omnr.3E.mea.s$FIRE_YEAR, 
    data = omnr.3E.mea.s, FUN = length)

omnr.3E.int.Ne <- aggregate(omnr.3E.int.e$FINAL_SIZE ~ omnr.3E.int.e$FIRE_YEAR, 
    data = omnr.3E.int.e, FUN = length)

omnr.3E.int.Ns <- aggregate(omnr.3E.int.s$FINAL_SIZE ~ omnr.3E.int.s$FIRE_YEAR, 
    data = omnr.3E.int.s, FUN = length)

# Ecoregion 3W

omnr.3S.mea.Ne <- aggregate(omnr.3S.mea.e$FINAL_SIZE ~ omnr.3S.mea.e$FIRE_YEAR, 
    data = omnr.3S.mea.e, FUN = length)

omnr.3S.mea.Ns <- aggregate(omnr.3S.mea.s$FINAL_SIZE ~ omnr.3S.mea.s$FIRE_YEAR, 
    data = omnr.3S.mea.s, FUN = length)

omnr.3S.int.Ne <- aggregate(omnr.3S.int.e$FINAL_SIZE ~ omnr.3S.int.e$FIRE_YEAR, 
    data = omnr.3S.int.e, FUN = length)

omnr.3S.int.Ns <- aggregate(omnr.3S.int.s$FINAL_SIZE ~ omnr.3S.int.s$FIRE_YEAR, 
    data = omnr.3S.int.s, FUN = length)
```






```r
show(omnr.3W.mea.Ne)
```



```
##   omnr.3W.mea.e$FIRE_YEAR omnr.3W.mea.e$FINAL_SIZE
## 1                    1989                        1
## 2                    1995                        4
## 3                    1996                       11
## 4                    1998                        2
## 5                    2002                        1
## 6                    2003                        1
```





```r
show(omnr.3W.mea.Ns)
```



```
##    omnr.3W.mea.s$FIRE_YEAR omnr.3W.mea.s$FINAL_SIZE
## 1                     1989                       20
## 2                     1991                        3
## 3                     1995                       17
## 4                     1996                       10
## 5                     1997                        2
## 6                     1998                        3
## 7                     1999                        1
## 8                     2002                        2
## 9                     2003                        1
## 10                    2004                        1
```





```r
show(omnr.3W.int.Ne)
```



```
##   omnr.3W.int.e$FIRE_YEAR omnr.3W.int.e$FINAL_SIZE
## 1                    1992                        4
## 2                    1995                       13
## 3                    1996                       41
## 4                    1998                        2
## 5                    1999                        3
## 6                    2002                        1
## 7                    2003                        3
```





```r
show(omnr.3W.int.Ns)
```



```
##    omnr.3W.int.s$FIRE_YEAR omnr.3W.int.s$FINAL_SIZE
## 1                     1989                       14
## 2                     1990                        5
## 3                     1991                       12
## 4                     1992                        2
## 5                     1993                        2
## 6                     1994                       14
## 7                     1995                       44
## 8                     1996                       32
## 9                     1997                       14
## 10                    1998                       22
## 11                    1999                        6
## 12                    2000                        4
## 13                    2001                        8
## 14                    2002                        6
## 15                    2003                        7
## 16                    2004                        4
```






```r
show(omnr.3E.mea.Ne)
```



```
##   omnr.3E.mea.e$FIRE_YEAR omnr.3E.mea.e$FINAL_SIZE
## 1                    1991                        3
## 2                    1992                        2
## 3                    1995                        6
## 4                    1996                        2
## 5                    1997                        3
## 6                    1998                        1
## 7                    2001                        1
## 8                    2002                        1
```





```r
show(omnr.3E.mea.Ns)
```



```
##    omnr.3E.mea.s$FIRE_YEAR omnr.3E.mea.s$FINAL_SIZE
## 1                     1989                        5
## 2                     1990                        2
## 3                     1991                       21
## 4                     1992                       11
## 5                     1993                        1
## 6                     1994                       16
## 7                     1995                       17
## 8                     1996                        9
## 9                     1997                        9
## 10                    1998                        7
## 11                    1999                        1
## 12                    2000                        6
## 13                    2001                        2
## 14                    2002                        4
```





```r
show(omnr.3E.int.Ne)
```



```
##   omnr.3E.int.e$FIRE_YEAR omnr.3E.int.e$FINAL_SIZE
## 1                    1990                        1
## 2                    1991                        3
## 3                    1992                        1
## 4                    1995                        6
## 5                    1997                        3
## 6                    1998                        2
## 7                    1999                        2
## 8                    2003                        2
```





```r
show(omnr.3E.int.Ns)
```



```
##    omnr.3E.int.s$FIRE_YEAR omnr.3E.int.s$FINAL_SIZE
## 1                     1989                        8
## 2                     1990                        1
## 3                     1991                       16
## 4                     1992                        8
## 5                     1994                        7
## 6                     1995                       18
## 7                     1996                        8
## 8                     1997                       10
## 9                     1998                       17
## 10                    1999                       11
## 11                    2000                       13
## 12                    2001                       21
## 13                    2002                        5
## 14                    2003                        5
## 15                    2004                        4
```






```r
show(omnr.3S.mea.Ne)
```



```
##    omnr.3S.mea.e$FIRE_YEAR omnr.3S.mea.e$FINAL_SIZE
## 1                     1989                        6
## 2                     1993                        2
## 3                     1994                        2
## 4                     1995                       11
## 5                     1996                       10
## 6                     1998                        1
## 7                     1999                        4
## 8                     2001                        1
## 9                     2002                        2
## 10                    2003                        3
```





```r
show(omnr.3S.mea.Ns)
```



```
##    omnr.3S.mea.s$FIRE_YEAR omnr.3S.mea.s$FINAL_SIZE
## 1                     1989                       16
## 2                     1990                        6
## 3                     1991                       10
## 4                     1992                        4
## 5                     1993                        2
## 6                     1994                        7
## 7                     1995                       16
## 8                     1996                       10
## 9                     1997                        2
## 10                    1998                        7
## 11                    1999                        7
## 12                    2001                        1
## 13                    2002                        1
## 14                    2003                        2
```





```r
show(omnr.3S.int.Ne)
```



```
##   omnr.3S.int.e$FIRE_YEAR omnr.3S.int.e$FINAL_SIZE
## 1                    1994                        1
## 2                    1995                        1
## 3                    1997                        1
## 4                    1999                        2
## 5                    2002                        5
```





```r
show(omnr.3S.int.Ns)
```



```
##    omnr.3S.int.s$FIRE_YEAR omnr.3S.int.s$FINAL_SIZE
## 1                     1989                        4
## 2                     1991                        1
## 3                     1992                        1
## 4                     1993                        1
## 5                     1994                        1
## 6                     1995                        6
## 7                     1996                        4
## 8                     1998                        2
## 9                     1999                        6
## 10                    2000                        1
## 11                    2001                        5
## 12                    2002                        3
## 13                    2003                        8
## 14                    2004                        1
```



