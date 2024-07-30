pollutantmean <- function(directory, pollutant, id = 1:332) {
  pollutants <- c()
  #create list of files
  files_list <- list.files(directory, full.names=TRUE)
  #create empty data frame
  dat <- data.frame()
  #loop through files until id is found
  for(i in id) {
    #read the data files and add to data frame
    dat <- rbind(dat, read.csv(files_list[i],header=TRUE))
  }
  #find mean
  pollutants_mean <- mean(dat[,pollutant], na.rm=TRUE)
  #return mean
  return(pollutants_mean)
}