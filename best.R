## The function 'best' takes two arguments:
## 1. The 2-character abbreviated name of a state
## 2. An outcome name ('heart attack', 'heart failure', or 'pneumonia')

## The function reads the 'outcome-of-care-measures.csv' file and
## returns a character vector with the name of the hospital that has
## the best (i.e., lowest) 30-day mortality rate for the specified
## outcome in that state. Hospitals that do not have data on a 
## particular outcome are excluded from the set of hospitals when
## deciding the rankings. If there is a tie for the best hospital for a
## given outcome, the function returns the tied hospital that comes
## first alphabetically.

best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if (!any(state == data$State)) {
                ## Throw an error if an invalid state value is passed
                stop("invalid state")
        }

        if (outcome == "heart attack"){
                i <- 11
        }
        
        else if (outcome == "heart failure"){
                i <- 17
        }
        
        else if (outcome == "pneumonia"){
                i <- 23
        }
        
        else {
                ## Throw an error if an invalid outcome value is passed
                stop ("invalid outcome")
        }
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        
        data.state <- data[data$State == state, ]
        data.state [, i] <- as.numeric(x = data.state[, i])
        data.state <- data.state [complete.cases(data.state), ]
        return.names <- data.state[(data.state[, i] == min(data.state[, i])), ]$Hospital.Name
        
        sort(return.names)
}
