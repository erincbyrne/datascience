corr <- function(directory, threshold = 0) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0
      
      ## Return a numeric vector of correlations
      
      obs <- complete(directory)
      id <- obs[["id"]][obs$nobs>threshold]
      cors <- numeric()
      
      
      for(i in id){
            if(i<10){ head="00"} else if(i<100){ head="0" } else{ head=""}
            d <- read.csv(paste(directory,"/",head,i,".csv",sep=""))
            
            ## use <- !is.na(d[["nitrate"]]) & !is.na(d[["sulfate"]])
            cors <- c(cors, cor(d[["nitrate"]],d[["sulfate"]],use="complete.obs"))
            ## dataS <- c(dataS,d[["sulfate"]][use])
      }
      
      #cor(dataN,dataS)
      cors
}