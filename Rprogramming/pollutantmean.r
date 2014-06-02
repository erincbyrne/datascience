pollutantmean <- function(directory, pollutant,id=1:332){
      
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'pollutant' is a character vector of length 1 indicating
      ## the name of the pollutant for which we will calculate the
      ## mean; either "sulfate" or "nitrate".
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return the mean of the pollutant across all monitors list
      ## in the 'id' vector (ignoring NA values)
      
      data <- numeric()

      for(i in id){
            if(i<10){ head="00"} else if(i<100){ head="0" } else{ head=""}
            d <- read.csv(paste(directory,"/",head,i,".csv",sep=""))
            data <- c(data,d[[pollutant]][!is.na(d[[pollutant]])])
      }

      mean(data,na.rm=TRUE)
}