
# load OMNR datase
omnr <- read.csv("~/Dropbox/Masters/m_thesis/OMNR/OMNR_data.csv")

omnr.mea <- subset(omnr, subset = omnr$FIRE_MGT_ZONE == "MEA")

omnr.int <- subset(omnr, subset = omnr$FIRE_MGT_ZONE == "INT")

omnr.mea.s <- subset(omnr.mea, subset = omnr.mea$FINAL_SIZE > 3 & omnr.mea$FINAL_SIZE < 200)

omnr.mea.e <- subset(omnr.mea, subset = omnr.mea$FINAL_SIZE > 200)

omnr.int.s <- subset(omnr.int, subset = omnr.int$FINAL_SIZE > 3 & omnr.int$FINAL_SIZE < 200)

omnr.int.e <- subset(omnr.int, subset = omnr.int$FINAL_SIZE > 200)

mea.ns <- aggregate(omnr.mea.s$FINAL_SIZE, by=list(omnr.mea.s$FIRE_YEAR),length)

mea.ne <- aggregate(omnr.mea.e$FINAL_SIZE, by=list(omnr.mea.e$FIRE_YEAR),length)

int.ns <- aggregate(omnr.int.s$FINAL_SIZE, by=list(omnr.int.s$FIRE_YEAR),length)

int.ne <- aggregate(omnr.int.e$FINAL_SIZE, by=list(omnr.int.e$FIRE_YEAR),length)

omnr.glm <- data.frame(zone=rep(c("mea","int"),c(16,16)),year=rep(1989:2004,2),suppressed=c(49,10,52,28,5,34,58,33,21,23,12,6,6,11,10,1,137,83,12,79,42,93,199,89,73,150,83,57,101,38,77,16),unsuppressed=c(7,0,14,2,2,4,26,27,6,4,6,0,2,6,6,0,7,5,8,7,1,1,27,54,5,15,12,1,0,10,10,1))

glm.eq <- "cbind(omnr.glm$suppressed, omnr.glm$unsuppressed) ~ omnr.glm$zone * omnr.glm$year"

glm.out <- glm(glm.eq, family=binomial(logit), data=omnr.glm)

summary(glm.out)

plot(glm.out$fitted)




names(Ne) <- c("Year", "Ne")

new <- data.frame(Ne, Ns)

new <- subset(new, select = -Year.1)

glm.out = glm(cbind(set$Escapes, set$Suppressed)~ set$Year, family=binomial)

plot(set$Escapes/set$Suppressed ~ set$Year, data=set)
lines(set$Year, glm.out$fitted, type="l", col="red")