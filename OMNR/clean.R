
## Transform and clean omnr dataset

# show only fires caused by lightening & exclude fires in the extencive zone

omnr.clean <- subset(omnr, subset = (omnr$FIRE_MGT_ZONE == "MEA" | omnr$FIRE_MGT_ZONE == "INT") & omnr$GENERAL_CAUSE == "LTG") # create subset of omnr.ltg == only fires in the Intensive and Measured Zones
