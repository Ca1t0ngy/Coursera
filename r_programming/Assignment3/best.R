## Coursera Data Science 
## Course 2: R Programming 
## Week 4 Assignemnt : Hospital Compare

best <- function(state, outcome) {
        ## 'state':
        
        ## 'outcome':
        
        ##  Return: Return hospital name in the state with lowest 30-day death
        ##  rate
        
        # Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        outcome_data[, 11] <- as.numeric(outcome_data[, 11])
        outcome_data[, 17] <- as.numeric(outcome_data[, 17])
        outcome_data[, 23] <- as.numeric(outcome_data[, 23])
        # Restore the col names for later use
        col_names <- colnames(outcome_data)
        
        # Check that state and outcome are valid 
        list_outcome <- c('heart attack', 'heart failure', 'pneumonia')
        list_state <- unique(outcome_data[, 7])
        
        if(!is.element(state, list_state)){
                stop("invalide state")
                
        }
        
        if(!is.element(outcome, list_outcome)){
                stop("invalid outcome")
        
        }
        
        # find the best hospital.
        if(outcome=='heart attack'){cause <- 11}
        if(outcome=='heart failure') {cause <- 17}
        if(outcome=='pneumonia') {cause <- 23}
        
        # extract 3 cols 
        sub_data <- outcome_data[, c(2, 7, cause)]
        # str(sub_data)
        # extract the state 
        sub_data_state <- sub_data[which(sub_data[, 2]==state), c(col_names[2], col_names[cause])]
        # find the lowest death rate 
        lowest <- min(sub_data_state[, 2], na.rm = TRUE)
        hospital <- sub_data_state[which(sub_data_state[, 2] == lowest), 'Hospital.Name']
        # print(hospital)
        hospital <- sort(hospital)
        return(hospital[1])
        
}