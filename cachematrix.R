## In the this code the functions are used to catche the inverse of a matrix 
## to prevent repeated computations of the inverse in larger codes

## The following function creates a special "matrix" object that can cache its
## inverse

makeCacheMatrix <- function(x = matrix()) {
        # Initialising the inverse
        i <- NULL
        # Set the matrix
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        # Get the matrix
        get <- function() {
                x
        }
        # Set the inverse of the matrix
        setinverse <- function(inverse) {
                i <<- inverse
        }
        # Get the inverse of the matrix
        getinverse <- function() {
                m
        }
        list(set = set, get = get,
             setinverse = setinverse
             getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then cacheSolve retrieves the inverse from the 
## cache.


cacheSolve <- function(x, ...) {
        # Get the inverse of the matrix
        m <- x$getinverse()
        # Return the inverse of the matrix if it is already set
        if (!is.null(m)) {
                message("getting catched data")
                return(m)
        }
        # Get the matrix
        data <- x$get()
        # Calculate the inverse of the matrix
        m <- solve(data, ... )
        # Set the inverse of the matrix
        x$setinverse(m)
        # Return the matrix
        m
}