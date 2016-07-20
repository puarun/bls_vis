df.un <- data.frame()
getData<-function(){
  for (i in 1:15){
    if (i<10)
      str=paste(0,i,sep='')
    else
      str=as.character(i)
    
    temp<-read.xlsx2(paste('~/Documents/bls_shiny/data/laucnty',str,'.xlsx',sep = ''),startRow = 7,sheetIndex = 1,header = FALSE)
    names(temp)<-c('laus','state_cd','county_cd','County_Name','Year','blank','Labor','Employed','Unemployed','rate')
    df.un <- rbind(df.un,temp)    
  }
  return(df.un)
}
