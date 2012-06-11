Fire Probability
========================================================



```r
omnr <- read.csv("OMNR_data.csv")  # load OMNR dataset

attach(omnr)

# Clean dataset = Only fires in the Measured and Intensive Zones + caused
# = Lightening

omnr.zones <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE == "MEA" | 
    omnr$FIRE_MGT_ZONE == "INT") & omnr$GENERAL_CAUSE == "LTG")

# Calculate the number of fires that escape Initial Attach fire
# Suppression

Et.MEA <- (sum(omnr$FINAL_SIZE > 3 & omnr$FIRE_MGT_ZONE == "MEA"))
Et.INT <- (sum(omnr$FINAL_SIZE > 3 & omnr$FIRE_MGT_ZONE == "INT"))

# Calculate the number of escaped fires that grow to become large (>200ha)
# fires

Lt.MEA <- (sum(omnr$FINAL_SIZE > 200 & omnr$FIRE_MGT_ZONE == "MEA"))
Lt.INT <- (sum(omnr$FINAL_SIZE > 200 & omnr$FIRE_MGT_ZONE == "INT"))

# Calculate the propability of an escaped fire becoming a large fire

pt.MEA <- Lt.MEA/Et.MEA
pt.INT <- Lt.INT/Et.INT
```




Display probability of an escaped fire becoming a large fire in Measured Zone



```r
show(pt.MEA)
```



```
## [1] 0.2373
```




Display probability of an escaped fire becoming a large fire in Intensive Zone



```r
show(pt.INT)
```



```
## [1] 0.1019
```




Therefore, the probability of an escaped fire becoming a large fire in Measured Zone is approximately twice that of the probability in the Intensive Zone (i.e., 24% vs 10%). This is what one would expect if more aggressive fire suppression is effective at reducing the number of very large fires.

### Session info:



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



