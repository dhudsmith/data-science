corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0

    ## Return a numeric vector of correlations

    id_nobs <- complete(directory)
    id <- id_nobs[id_nobs[, "nobs"] > threshold, "id"]

    correlation <- vector()

    for (file_num in id) {

        file_path <- paste(directory, "/", sprintf("%03d", file_num),
                           ".csv", sep = "")
        
        data <- read.csv(file_path)

        correlation <- c(correlation, 
                         cor(data[complete.cases(data), "nitrate"],
                             data[complete.cases(data), "sulfate"]
                            )
                        )
    }

    correlation
}