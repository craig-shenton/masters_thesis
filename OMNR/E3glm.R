
omnr.glm <- data.frame(zone=rep(c("mea","int"),c(3,3)),ecoregion=rep(c("E3","W3","S3")),suppressed=c(60,194,111,152,91,44),unsuppressed=c(20,67,19,20,43,10))

glm.eq <- "cbind(suppressed, unsuppressed) ~ zone * ecoregion"

glm.out <- glm(glm.eq, family=binomial(logit), data=omnr.glm)


summary(glm.out)

anova(glm.out, test="Chisq")