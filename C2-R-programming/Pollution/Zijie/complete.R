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

    df <- data.frame(id = integer(), nobs = integer())

    for (file_num in id){

        file_name <- paste(directory, "/", sprintf("%03d", file_num),
                           ".csv", sep = "")

        data <- read.csv(file_name)

        df <- rbind(df, data.frame(id = file_num, 
                                   nobs = nrow(data[complete.cases(data), ])
                                  ) 
                   )

    }

    df
}