# download and unzip data file
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "rprog_data_specdata.zip")
unzip("rprog_data_specdata.zip", exdir = "specdata")


files_full <- list.files("specdata", full.names=TRUE)

tmp <- vector(mode = "list", length = length(files_full))

for (i in seq_along(files_full)) {
        tmp[[i]] <- read.csv(files_full[[i]])
}

output <- do.call(rbind, tmp)

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