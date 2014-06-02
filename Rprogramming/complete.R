complete <- function(directory, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return a data frame of the form:
      ## id nobs
      ## 1  117
      ## 2  1041
      ## ...
      ## where 'id' is the monitor ID number and 'nobs' is the
      ## number of complete cases

      data <- data.frame("id"=id,"nobs"=numeric(length(id)))
      
      for(i in seq_along(id)){
            if(id[i]<10){ head="00"} else if(id[i]<100){ head="0" } else{ head=""}
            d <- read.csv(paste(directory,"/",head,id[i],".csv",sep=""))
            
            data$nobs[i] <- sum(!is.na(d$sulfate) & !is.na(d$nitrate))
      }
      
      data
}