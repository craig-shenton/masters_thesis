
```r

title(main = "Notched Boxplots", xlab = "Group", font.main = 4, font.lab = 1)
```

```
## Error: plot.new has not been called yet
```

```r

## An example showing how to fill between curves.

par(bg = "white")

n <- 100

y <- c(0.83, 0.77, 0.74)

x <- c("3e", "3w", "3s")

xx <- c(0:n, n:0)

yy <- c(x, rev(y))

plot(xx, yy, type = "n", xlab = "Time", ylab = "Distance")
```

```
## Error: 'x' and 'y' lengths differ
```

```r

polygon(xx, yy, col = "gray")
```

```
## Error: 'x' and 'y' lengths differ
```

```r

```


