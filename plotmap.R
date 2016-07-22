plotmap <- function(df1){
  
  
  # Plot dfloyment by country
  colors = c("#F1EEF6", "#D4B9DA", "#C994C7", "#DF65B0", "#DD1C77", 
             "#980043")
  
  df1$colorBuckets <- as.numeric(cut(df1$rate, c(0, 2, 4, 6, 8, 
                                               10, 100)))
  colorsmatched <- df1$colorBuckets[match(as.numeric(county.fips$fips), as.numeric(df1$fips))]
  
  map("county", col = colors[colorsmatched], fill = TRUE, resolution = 0, 
      lty = 0, projection = "polyconic")
  ## Loading required package: mapproj
  
  # Add border around each State
  map("state", col = "white", fill = FALSE, add = TRUE, lty = 1, lwd = 0.2, 
      projection = "polyconic")
  title("Unemployment rate by county")
  
  leg.txt <- c("<2%", "2-4%", "4-6%", "6-8%", "8-10%", ">10%")
  legend("topright", leg.txt, horiz = TRUE, fill = colors)
  
}