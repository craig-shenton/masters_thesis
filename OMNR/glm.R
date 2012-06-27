
omnr.E3 <- data.frame(zone=rep(c("mea","int"),c(16,16)),year=rep(1989:2004,2),suppressed=c(5,2,21,11,1,16,17,9,9,7,1,6,2,4,0,0,8,1,16,8,0,7,18,8,10,17,11,13,21,5,5,4),unsuppressed=c(0,0,3,2,0,0,6,2,3,1,0,0,1,1,0,0,0,1,3,1,0,0,6,0,3,2,2,0,0,0,2,0))

omnr.W3 <- data.frame(zone=rep(c("mea","int"),c(16,16)),year=rep(1989:2004,2),suppressed=c(20,0,3,0,0,0,17,10,2,3,1,0,0,2,1,1,14,5,12,2,2,14,44,32,14,22,6,4,8,6,7,4),unsuppressed=c(1,0,0,0,0,0,4,11,0,2,0,0,0,1,1,0,0,0,0,4,0,0,13,41,0,2,3,0,0,1,3,0))

omnr.S3 <- data.frame(zone=rep(c("mea","int"),c(16,16)),year=rep(1989:2004,2),suppressed=c(16,6,10,4,2,7,16,10,2,7,7,0,1,1,2,0,4,0,1,1,1,1,0,4,0,2,6,1,5,3,8,1),unsuppressed=c(6,0,0,0,2,2,11,10,0,1,4,0,1,2,4,0,0,0,0,0,0,1,1,0,1,0,0,2,0,5,0,0))




E3.eq <- "cbind(omnr.E3$suppressed, omnr.E3$unsuppressed) ~ omnr.E3$zone"

W3.eq <- "cbind(omnr.W3$suppressed, omnr.W3$unsuppressed) ~ omnr.W3$zone"

S3.eq <- "cbind(omnr.S3$suppressed, omnr.S3$unsuppressed) ~ omnr.S3$zone"


E3.out <- glm(E3.eq, family=binomial(logit), data=omnr.E3)

W3.out <- glm(W3.eq, family=binomial(logit), data=omnr.W3)

S3.out <- glm(S3.eq, family=binomial(logit), data=omnr.S3)


summary(E3.out)

summary(W3.out)

summary(S3.out)

anova(E3.out, test="Chisq")

anova(W3.out, test="Chisq")

anova(S3.out, test="Chisq")
