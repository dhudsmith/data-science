source("misc.R")

#############################################################################
# 4 : Ranking hospitals by outcome in all state #############################
#############################################################################

rankall <- function(outcome, num="best") {
    ## Read outcome data
    data <- loaddata(outcome)

    ## Get set of states
    state_list <- sort(unique(data[,"state"]))

    ## For each state, find the hospital of the given rank
    hospital <- list()
    for (state in state_list) {
        this_hospital <- sortrank(data[data["state"]==state,],outcome,num)
        hospital <- c(hospital,this_hospital)
    }

    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data.frame(hospital=unlist(hospital),state=unlist(state_list),
               row.names=state_list)
}
