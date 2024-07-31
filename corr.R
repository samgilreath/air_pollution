corr <- function(directory, threshold = 0) {
  #create list of files
  files_list <- list.files(directory, full.names=TRUE)
  #create empty vector
  dat <- vector(mode = "numeric", length = 0)
 
  for(i in 1:332) {
    #read the data files
    alldata <- read.csv(files_list[i], header=TRUE)
    complete <- alldata[complete.cases(alldata),]
    #count observations
    count <- nrow(complete)
    
      #threshold test and correlation calc
      if(count > threshold) {
        dat <- c(dat,cor(complete$nitrate,complete$sulfate))
      }
  }  
  
  return(dat)
}