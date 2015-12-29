## The function 'rankhospital' takes three arguments:
## 1. The 2-character abbreviated name of a state
## 2. An outcome
## 3. The ranking of a hospital in that state for that outcome

## The function reads the outcome-of-care-measures.csv file and returns
## a character vector with the name of the hospital that has the ranking
## specified by the num argument. The num argument can take values
## 'best', 'worst', or an integer indicating the ranking. If the number
## given by num is larger than the number of hospitals in that state, then
## the function will return NA. Hospitals that do not have data on a
## particular outcome are excluded from the set of hospitals when deciding
## the rankings.

## If there is a tie (i.e., multiple hospitals have the same 30-day 
## mortality rate for a given cause of death), the function returns
## the tied hospital that comes first alphabetically.



rankhospital <- function(state, outcome, num = "best") {
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

        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        data.state <- data[data$State == state, ]
        data.state[, i] <- as.numeric(x=data.state[, i])
        data.state <- data.state[complete.cases(data.state), ]
        
        if(num == "best") {
                num = 1
        }
        else if(num == "worst") {
                num = nrow(data.state)
        }
        else if(is.numeric(x = num)) {
                if(num<1 || num > nrow(data.state)) {
                        return(NA)
                }
        }
        else {
                ## Thrown an error if the argument is invalid
                stop('invalid num')
        }
        data.state <- data.state[order(data.state[,i], data.state$Hospital.Name), ]
        
        return.names <- data.state[num, ]$Hospital.Name
        return.names
}
