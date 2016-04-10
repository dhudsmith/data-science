library(readr)

#Part 1
pollutantmean <- function(directory, pollutant, id = 1:322){
  # Get the files
  files.ls <- list.files(directory)[id]
  
  # Get the sum of pollutant and number of observations for each id
  pollutant.vec <- vapply(files.ls, 
                             function(x){
                               full_path <- file.path(directory, x)
                               df <- read_csv(full_path)
                               
                               # Return the total and the number of non NA elements
                               tot = sum(df[,pollutant],na.rm = T)
                               non.na = sum(!is.na(df[,pollutant]))
                               return( c(tot, non.na) )
                               },
                             FUN.VALUE = numeric(2)
                             )
  
  # Calculate the mean
  sum(pollutant.vec[1,])/sum(pollutant.vec[2,])
}
