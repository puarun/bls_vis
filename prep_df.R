#setwd('~/Documents/bls_shiny/')
df<-read.csv('data/unemployment.csv')
#df$county <-sapply(strsplit(as.character(df$County_Name), ","), "[[", 1)
#df$county <- tolower(df$county)
#df$c_name <-sapply(strsplit(as.character(df$County_Name), " "), "[[", 1)
#df$c_name<- tolower(df$c_name)
df$fips <- substr(as.character(df$laus),3,7)
df$rate <- as.numeric(as.character(df$rate))
df <- df[,c(6:11)]

#temp1 <- temp[,c(7:11,13)]

require(maps)
require(ggmap)
require(mapproj)
data(county.fips)
  
# filter
#year=2010
#df = df[df$Year==year,]
