
## Transform and clean omnr dataset

omnr <- read.csv("~/Dropbox/Masters/m_thesis/OMNR/OMNR_data.csv")

# exclude fires in the extensive zone

omnr.clean <- subset(omnr, subset = omnr$FIRE_MGT_ZONE == "MEA" | omnr$FIRE_MGT_ZONE == "INT")

omnr.3E <- subset(omnr.clean, subset = (omnr.clean$LATITUDE>=48 & omnr.clean$LATITUDE<=51) & (omnr.clean$LONGITUDE<=-80 & omnr.clean$LONGITUDE>=-86))

omnr.3W <- subset(omnr.clean, subset = (omnr.clean$LATITUDE>=48 & omnr.clean$LATITUDE<=51) & (omnr.clean$LONGITUDE<=-88 & omnr.clean$LONGITUDE>=-92))

omnr.3S <- subset(omnr.clean, subset = (omnr.clean$LATITUDE>=51 & omnr.clean$LATITUDE<=53) & (omnr.clean$LONGITUDE<=-88 & omnr.clean$LONGITUDE>=-96))

