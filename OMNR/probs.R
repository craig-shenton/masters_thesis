omnr <- read.csv("C:/users/snorkle/desktop/dropbox/masters/m_thesis/omnr.csv")

omnr.zones <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE == "MEA" | omnr$FIRE_MGT_ZONE == "INT") & omnr$GENERAL_CAUSE == "LTG")

Et.MEA  <- (sum(omnr$FINAL_SIZE > 3 & omnr$FIRE_MGT_ZONE == "MEA"))
Et.INT  <- (sum(omnr$FINAL_SIZE > 3 & omnr$FIRE_MGT_ZONE == "INT"))

Lt.MEA  <- (sum(omnr$FINAL_SIZE > 200 & omnr$FIRE_MGT_ZONE == "MEA"))
Lt.INT  <- (sum(omnr$FINAL_SIZE > 200 & omnr$FIRE_MGT_ZONE == "INT"))

pt.MEA. <- Lt.MEA / Et.MEA
pt.INT. <- Lt.INT / Et.INT