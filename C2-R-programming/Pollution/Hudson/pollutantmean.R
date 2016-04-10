library(readr)

#Part 1
pollutantmean <- function(directory, pollutant, id = 1:322){
  # Get the files
  files.ls <- list.files(directory)[id]
  
  # Calculate the mean
  pollutant.vector <- vapply(files.ls, 
                             function(x){
                               full_path <- file.path(directory, x)
                               df <- read_csv(full_path)
                               return( df[,pollutant])
                               },
                             FUN.VALUE = numeric(1)
                             )
  return(pollutant.vector)
  return(mean(pollutant.vector, na.rm = T))
}