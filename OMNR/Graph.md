Calculations
========================================================

Calculating the area burned per year & the number of arrivals (i.e., new fires) per year


```r
omnr <- read.csv("OMNR_data.csv", header = TRUE)

## INT

# create subset omnr.clean == only fires in the Intensive and Measured
# Zones & caused by Lightening
omnr.clean <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE == "INT"))

# then with omnr.clean <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE ==
# 'MEA'))

omnr.3E <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 48 & omnr.clean$LATITUDE <= 
    51) & (omnr.clean$LONGITUDE <= -80 & omnr.clean$LONGITUDE >= -86))

omnr.3W <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 48 & omnr.clean$LATITUDE <= 
    51) & (omnr.clean$LONGITUDE <= -88 & omnr.clean$LONGITUDE >= -92))

omnr.3S <- subset(omnr.clean, subset = (omnr.clean$LATITUDE >= 51 & omnr.clean$LATITUDE <= 
    53) & (omnr.clean$LONGITUDE <= -88 & omnr.clean$LONGITUDE >= -96))

omnr.total <- rbind(omnr.3E, omnr.3W, omnr.3S)

# total fires in INT

int <- 4886

# fire size class a

a <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 0.4)

burn <- aggregate(a$FINAL_SIZE, by = list(a$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 27.09
```

```r

a <- aggregate(a$FINAL_SIZE, by = list(a$FIRE_YEAR), length)

names(a) <- c("Year", "Fires")

a <- sum(a$Fires)

a
```

```
## [1] 3198
```

```r

ap <- (a/int) * 100

ap
```

```
## [1] 65.45
```

```r

# fire size class b

b <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 4)

burn <- aggregate(b$FINAL_SIZE, by = list(b$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 115.7
```

```r

b <- aggregate(b$FINAL_SIZE, by = list(b$FIRE_YEAR), length)

names(b) <- c("Year", "Fires")

b <- sum(b$Fires)

b <- b - a

b
```

```
## [1] 1226
```

```r

bp <- (b/int) * 100

bp
```

```
## [1] 25.09
```

```r

# fire size class c

c <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 40)

burn <- aggregate(c$FINAL_SIZE, by = list(c$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 320.1
```

```r

c <- aggregate(c$FINAL_SIZE, by = list(c$FIRE_YEAR), length)

names(c) <- c("Year", "Fires")

c <- sum(c$Fires)

c <- c - b - a

c
```

```
## [1] 292
```

```r

cp <- (c/int) * 100

cp
```

```
## [1] 5.976
```

```r

# fire size class d

d <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 200)

burn <- aggregate(d$FINAL_SIZE, by = list(d$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 741.3
```

```r

d <- aggregate(d$FINAL_SIZE, by = list(d$FIRE_YEAR), length)

names(d) <- c("Year", "Fires")

d <- sum(d$Fires)

d <- d - c - b - a

d
```

```
## [1] 72
```

```r

dp <- (d/int) * 100

dp
```

```
## [1] 1.474
```

```r

# fire size class e

e <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 1000)

burn <- aggregate(e$FINAL_SIZE, by = list(e$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 2266
```

```r

e <- aggregate(e$FINAL_SIZE, by = list(e$FIRE_YEAR), length)

names(e) <- c("Year", "Fires")

e <- sum(e$Fires)

e <- e - d - c - b - a

e
```

```
## [1] 46
```

```r

ep <- (e/int) * 100

ep
```

```
## [1] 0.9415
```

```r

# fire size class f

f <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 10000)

burn <- aggregate(f$FINAL_SIZE, by = list(f$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 13431
```

```r

f <- aggregate(f$FINAL_SIZE, by = list(f$FIRE_YEAR), length)

names(f) <- c("Year", "Fires")

f <- sum(f$Fires)

f <- f - e - d - c - b - a

f
```

```
## [1] 42
```

```r

fp <- (f/int) * 100

fp
```

```
## [1] 0.8596
```

```r

# fire size class g

g <- subset(omnr.total, subset = omnr.total$FINAL_SIZE > 10000)

burn <- aggregate(g$FINAL_SIZE, by = list(g$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 49920
```

```r

g <- aggregate(g$FINAL_SIZE, by = list(g$FIRE_YEAR), length)

names(g) <- c("Year", "Fires")

g <- sum(g$Fires)

g
```

```
## [1] 10
```

```r

gp <- (g/int) * 100

gp
```

```
## [1] 0.2047
```

```r

## MEA

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

# total fires in MEA

mea <- 1643

# fire size class a

a <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 0.4)

burn <- aggregate(a$FINAL_SIZE, by = list(a$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 7.612
```

```r

a <- aggregate(a$FINAL_SIZE, by = list(a$FIRE_YEAR), length)

names(a) <- c("Year", "Fires")

a <- sum(a$Fires)

a
```

```
## [1] 834
```

```r

ap <- (a/mea) * 100

ap
```

```
## [1] 50.76
```

```r

# fire size class b

b <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 4)

burn <- aggregate(b$FINAL_SIZE, by = list(b$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 44.26
```

```r

b <- aggregate(b$FINAL_SIZE, by = list(b$FIRE_YEAR), length)

names(b) <- c("Year", "Fires")

b <- sum(b$Fires)

b <- b - a

b
```

```
## [1] 478
```

```r

bp <- (b/mea) * 100

bp
```

```
## [1] 29.09
```

```r

# fire size class c

c <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 40)

burn <- aggregate(c$FINAL_SIZE, by = list(c$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 198.6
```

```r

c <- aggregate(c$FINAL_SIZE, by = list(c$FIRE_YEAR), length)

names(c) <- c("Year", "Fires")

c <- sum(c$Fires)

c <- c - b - a

c
```

```
## [1] 204
```

```r

cp <- (c/mea) * 100

cp
```

```
## [1] 12.42
```

```r

# fire size class d

d <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 200)

burn <- aggregate(d$FINAL_SIZE, by = list(d$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 478.5
```

```r

d <- aggregate(d$FINAL_SIZE, by = list(d$FIRE_YEAR), length)

names(d) <- c("Year", "Fires")

d <- sum(d$Fires)

d <- d - c - b - a

d
```

```
## [1] 45
```

```r

dp <- (d/mea) * 100

dp
```

```
## [1] 2.739
```

```r

# fire size class e

e <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 1000)

burn <- aggregate(e$FINAL_SIZE, by = list(e$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 1586
```

```r

e <- aggregate(e$FINAL_SIZE, by = list(e$FIRE_YEAR), length)

names(e) <- c("Year", "Fires")

e <- sum(e$Fires)

e <- e - d - c - b - a

e
```

```
## [1] 36
```

```r

ep <- (e/mea) * 100

ep
```

```
## [1] 2.191
```

```r

# fire size class f

f <- subset(omnr.total, subset = omnr.total$FINAL_SIZE < 10000)

burn <- aggregate(f$FINAL_SIZE, by = list(f$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 9702
```

```r

f <- aggregate(f$FINAL_SIZE, by = list(f$FIRE_YEAR), length)

names(f) <- c("Year", "Fires")

f <- sum(f$Fires)

f <- f - e - d - c - b - a

f
```

```
## [1] 37
```

```r

fp <- (f/mea) * 100

fp
```

```
## [1] 2.252
```

```r

# fire size class g

g <- subset(omnr.total, subset = omnr.total$FINAL_SIZE > 10000)

burn <- aggregate(g$FINAL_SIZE, by = list(g$FIRE_YEAR), sum)

burn <- mean(burn$x)

burn
```

```
## [1] 43518
```

```r

g <- aggregate(g$FINAL_SIZE, by = list(g$FIRE_YEAR), length)

names(g) <- c("Year", "Fires")

g <- sum(g$Fires)

g
```

```
## [1] 9
```

```r

gp <- (g/mea) * 100

gp
```

```
## [1] 0.5478
```

```r

```

