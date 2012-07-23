


```r
x <- c(1, 2, 3, 4, 5)
y <- c(1.1, 2.3, 3, 3.9, 5.1)
ucl <- c(1.3, 2.4, 3.5, 4.1, 5.3)
lcl <- c(0.9, 1.8, 2.7, 3.8, 5)
plot(x, y, ylim = range(c(lcl, ucl)))
arrows(x, ucl, x, lcl, length = 0.05, angle = 90, code = 3)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

