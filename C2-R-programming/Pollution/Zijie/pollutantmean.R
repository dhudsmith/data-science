source("misc.R")

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)

    tot <- 0
    num <- 0

    for (file_num in id){
        data <- readdata(directory,file_num)

        relevant_data <- data[!is.na(data[pollutant]),pollutant]

        tot <- tot+sum(relevant_data)
        num <- num+length(relevant_data)
    }

    tot/num
}
