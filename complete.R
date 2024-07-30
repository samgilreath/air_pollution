complete <- function(directory, id = 1:332) {
  #create list of files
  files_list <- list.files(directory, full.names=TRUE)
  #create empty data frame
  dat <- data.frame()
  #loop through files until id is found
  for(i in id) {
    #read the data files
    temp <- read.csv(files_list[i], header=TRUE)
    temp <- na.omit(temp)
    #count completed data
    cNobs <- nrow(temp)
    #add completed data to data frame
    dat <- rbind(dat,data.frame(i,cNobs))
  }
  #return completed data
  return(dat)
}