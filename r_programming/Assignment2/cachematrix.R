## Two functions used to create a special object that stores a matrix
## and cache its inverse matrix. Using <<- operator for lexical scoping

## makeCacheMatrix: creates a special "matrix", which is really a list containing a function to
## 1. set the value of the matrix 
## 2. get the value of the matrix 
## 3. set the value of the inverse matrix 
## 4. get the value of the inverse matrix 

makeCacheMatrix <- function(x = numeric()) {
        inv <- NULL
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## cacheSolve: calculates the inverse matrix of the specail "matrix" created with the above funtion
## It first checks if the inverse matrix has already been calculated and stored, if so, it gets the
## inverse from the cache and skips the computation. Otherwise, it calculates the inverse matrix and
## sets the inverse matrix in the cache via the setinv function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv() 
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
        }
