setwd('~/Documents/bls_shiny/')
df<-read.csv('data/unemployment.csv')
df$county <-sapply(strsplit(as.character(df$County_Name), ","), "[[", 1)
df$county <- tolower(df$county)

df$c_name <-sapply(strsplit(as.character(df$County_Name), " "), "[[", 1)
df$c_name<- tolower(df$c_name)

df$fips <- substr(as.character(df$laus),3,7)

df$rate <- as.numeric(as.character(df$rate))

temp1 <- temp[,c(7:11,13)]


############***********notebook for plotting unemp county wise************###########
require(maps)
require(ggmap)

data(unemp)
data(county.fips)

# Plot unemployment by country
colors = c("#F1EEF6", "#D4B9DA", "#C994C7", "#DF65B0", "#DD1C77", 
           "#980043")

unemp$colorBuckets <- as.numeric(cut(unemp$unemp, c(0, 2, 4, 6, 8, 
                                                    10, 100)))
colorsmatched <- unemp$colorBuckets[match(county.fips$fips, unemp$fips)]

map("county", col = colors[colorsmatched], fill = TRUE, resolution = 0, 
    lty = 0, projection = "polyconic")

## Loading required package: mapproj


# Add border around each State
map("state", col = "white", fill = FALSE, add = TRUE, lty = 1, lwd = 0.2, 
    projection = "polyconic")
title("unemployment by county, 2009")

leg.txt <- c("<2%", "2-4%", "4-6%", "6-8%", "8-10%", ">10%")
legend("topright", leg.txt, horiz = FALSE, fill = colors)

##########******************matching 5 years data to buckets*********************

df$colorBuckets <- as.numeric(cut(as.double(df$rate),c(0,2,4,6,8,10,100)))

colorsmatched <- df$colorBuckets[match(as.numeric(county.fips$fips), as.numeric(df$fips))]

map("county", col = colors[colorsmatched], fill = TRUE, resolution = 0, 
    lty = 0, projection = "polyconic")

  
  
