library(readr)

#Part 1
pollutantmean <- function(directory, pollutant, id = 1:332){
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

# Part 2
complete <- function(directory, id = 1:332){
  # Get the files
  files.ls <- list.files(directory)[id]
  
  # Get the sum of pollutant and number of observations for each id
  nobs.vec <- vapply(files.ls, 
                          function(x){
                            full_path <- file.path(directory, x)
                            df <- read_csv(full_path)
                            
                            # Return the total and the number of complete observations
                            unname( sum( complete.cases(df) ) )
                          },
                          FUN.VALUE = numeric(1)
                     )
  
  # Convert to data.frame
  data.frame(id = id, nobs = nobs.vec, row.names = NULL)
}

# Part 3
corr <- function(directory, threshold = 0){
  # Get the files
  files.ls <- list.files(directory)
  
  # Get the file ids that meet the threshold
  files.ls <- files.ls[ subset( complete(directory), nobs > threshold )$id ]
  
  # Calculate the correlation
  cor.vec <- vapply(files.ls, 
                     function(x){
                       full_path <- file.path(directory, x)
                       df <- read_csv(full_path)
                       
                       # Return the correlations
                       cor(as.numeric(df$sulfate), as.numeric(df$nitrate), use = "complete.obs")
                     },
                     FUN.VALUE = numeric(1)
  )
  
  # Output
  unname( cor.vec )
}
