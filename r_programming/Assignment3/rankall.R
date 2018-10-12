## Coursera Data Science 
## Course 2: R Programming 
## Week 4 Assignemnt : Hospital Compare

rankall <- function(outcome, num = "best"){
        ## 'state':
        
        ## 'outcome':
        
        ## 'num':
        
        ##  Return: Return a data frame with the hospital names and the
        ##  (abbreviated) state name
        # hospital rank to return
          hospital_rank <- c()
          
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
        
        #if(!is.element(state, list_state)){
        #        stop("invalide state")
                
        #}
        
        if(!is.element(outcome, list_outcome)){
                stop("invalid outcome")
                
        }
        
        # defind outcome
        if(outcome=='heart attack'){cause <- 11}
        if(outcome=='heart failure') {cause <- 17}
        if(outcome=='pneumonia') {cause <- 23}
        
        # extract 3 cols 
        sub_data <- outcome_data[, c(2, 7, cause)]
        
        # rank hospital in each state 
        for(state in list_state){
                sub_data_state <- sub_data[which(sub_data[, 2]==state), c(1,3)]     
                # delete na 
                hospital <- sub_data_state[which(is.na(sub_data_state[, 2])==0), c(1,2)]
                # number of hospital with data 
                dim_hospital <- dim(hospital)
                # change colnames
                colnames(hospital) <- c('Hospital.Name', 'Mortality.Rate')
                hospital <- hospital[order(hospital$Mortality.Rate, hospital$Hospital.Name), ]
                # check num
                if(is.character(num)){
                        if(num == "best") {index = 1} else if(num == "worst") {
                                index <- dim_hospital[1]}   
                        hospital_rank <- c(hospital_rank, hospital[index, 1])
                } else if(is.numeric(num)){
                        if(num > dim_hospital[1]){
                                  hospital_rank <- c(hospital_rank, "NA")
                        } else {  index <- num 
                                  hospital_rank <- c(hospital_rank, hospital[index, 1])
                           }
                        
                }
                
        }

        rank_table <- cbind(hospital_rank, list_state)
        colnames(rank_table) <- c('hospital', 'state')
        rownames(rank_table) <- c(list_state)
       
        
        # return hospital name
        
        return(rank_table)        
        
        
        
        
        
        
        
}