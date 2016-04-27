source("misc.R")
source("rankhospital.R")

#############################################################################
# 2 : Best hospital in a state ##############################################
#############################################################################

best <- function(state,outcome) {
    rankhospital(state,outcome,"best")
}
