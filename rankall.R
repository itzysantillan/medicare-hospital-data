## The function 'rankall' takes two arguments:
## 1. An outcome name
## 2. A hospital ranking

## The function reads the outcome-of-care-measures.csv file and returns a 
## 2-column data frame containing the hospital in each state that has the
## ranking specified in num. The function should return a value for every
## state (some may be NA). The first column in the data frame is named
## hospital, which contains the hospital name. the second column is named
## state, which contains the 2-character abbreviation for the state
## name. Hospitals that do not have data on a particular outcome are
## excluded from the set of hospitals when deciding the rankings. 

## If there is a tie (i.e., multiple hospitals have the same 30-day 
## mortality rate for a given cause of death), the function returns
## the tied hospital that comes first alphabetically.

rankall <- function (outcome, num = "best"){
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that outcome is valid
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
        
        ## For each state, find the hospital of the given rank
        unique.states <- sort(unique(data$State))
        result.df <- list()
        
        for(state in unique.states) {
                data.state <- data[data$State == state, ]
                data.state[, i] <- as.numeric(x=data.state[, i])
                data.state <- data.state[complete.cases(data.state), ]
        
                if(num == "best") {
                        numrank = 1
                }
                else if(num == "worst") {
                        numrank = nrow(data.state)
                }
                else if(is.numeric(x=num)) {
                        if(num < 1 || num > nrow(data.state)) {
                                result.df <- rbind(result.df, list(NA, state))
                                next
                        }
                        else numrank <- num
                }
                else {
                        stop('invalid num')
                }
                
                data.state <- data.state[order(data.state[,i], data.state$Hospital.Name), ]
                return.names <- data.state[numrank, ]$Hospital.Name
                result.df <- rbind(result.df, list(return.names[1], state))
        }
        
        ## Return a data frame with the hospital names and the 
        ## (abbreviated) state name
        
        result.df <- as.data.frame(x=result.df)
        colnames(x=result.df) <- c('hospital', 'state')
        return(result.df)
}
