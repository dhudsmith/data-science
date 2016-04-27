#############################################################################
# Misc function #############################################################
#############################################################################

loaddata <- function(outcome) {
    ## Read outcome data
    data <- read.csv("data/outcome-of-care-measures.csv",
                        colClasses="character")
    # Keep only relevant data
    ## 11 : heart attack
    ## 17 : heart failure
    ## 23 : pneumonia
    ## 7 : state
    ## 2 : Hospital name
    data <- data[,c(2,7,11,17,23)]
    names(data) <- c("name","state","heart attack","heart failure",
                     "pneumonia")

    ## Check that outcome are valid
    if (length(which(names(data)==outcome))==0) {
        stop("invalid outcome")
    }

    ## Convert outcome to numerical values
    data <- data[,c("state","name",outcome)]
    data[,outcome] <- suppressWarnings(as.numeric(data[,outcome]))
    data <- data[complete.cases(data),]

    data
}

getstate <- function(state,outcome) {
    data <- loaddata(outcome)

    ## Check that state is valid
    data <- data[data["state"]==state,]
    if (nrow(data)==0) {
        stop("invalid state")
    }

    data
}

sortrank <- function(data,outcome,num="best") {
    # Sort rate, if tie exist, then sort by hospital name
    data <- data[order(data[,"name"]),]
    data <- data[order(data[,outcome]),]

    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if (num=="best") {
        data[1,"name"]
    } else if (num=="worst") {
        tail(data[,"name"],1)
    } else if (length(data)<=num) {
        data[num,"name"]
    } else {
        NA
    }

}
