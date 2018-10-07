## Coursera Data Science 
## Course 2: R Programming 
## Week 2 Assignemnt : Air Pollution 

Complete <- function(directory, id = 1:332){
        ## 'directory'
        
        ## 'id'
        
        ## Return 
        
        
        file_list <- list.files(directory, pattern = "*.csv")
        nobs <- c()
        
        for (i in id){
                
                data <- read.csv(paste(directory, file_list[i], sep = '/'))
                data <- is.na(data[c('sulfate', 'nitrate')])
                
                dimension <- dim(data)
                row_d <- dimension[1]
                
                count = 0
                for(i in 1:row_d){
                        if (sum(data[i,]) == 0){
                                count <- count + 1
                        }
                
                 
                }
                nobs <- c(nobs, count)  
                
        }
        result <- cbind(id,nobs)
        colnames(result) <- c('id', 'nobs')
        rownames(result) <- c(1:length(id))
        return(result) 
}