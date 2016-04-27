source("misc.R")

#############################################################################
# 3 : Ranking hospitals by outcome in a state ###############################
#############################################################################

rankhospital <- function(state,outcome,num="best") {
    data <- getstate(state,outcome)

    sortrank(data,outcome,num)
}
