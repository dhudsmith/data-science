#############################################################################
# 0 : Exploratory ###########################################################
#############################################################################

outcome <- read.csv("data/outcome-of-care-measures.csv",
                    colClasses="character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

#############################################################################
# 1 : 30-day mortality rates for heart attack ###############################
#############################################################################

# Check : heart attack
names(outcome)[11]

# Convert data to numerics
outcome[,11] <- suppressWarnings(as.numeric(outcome[,11]))
hist(outcome[,11],main="Heart Attack 30-day Mortality Rates",
     xlab="Risk Adjusted Rate (Percentage)")
