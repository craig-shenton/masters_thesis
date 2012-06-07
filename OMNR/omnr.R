
omnr <- read.csv("~/Dropbox/Masters/m_thesis/OMNR/OMNR_data.csv")

attach(omnr)

omnr.sub <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE=="INT" | omnr$FIRE_MGT_ZONE=="MEA") & omnr$GENERAL_CAUSE=="LTG")