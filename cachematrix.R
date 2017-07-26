#Using the example provided for vector means, I realized that the sample principles apply to matrix inverses. 

## creates a special "matrix", which is really a list containing a function to set the value of the matrix, get the value of the matrix,
##set the value of the inverse and get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <-function(y) {
    x <<- y ## <<- assigns values to objects in a different environment
    m <<- NULL
  }
  get <- function() x
  setinverse <-function(inverse) m <<- inverse
  getinverse <- function() m 
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## The following takes the output of makeCacheMatrix and returns an inverse of the orginal matrix input

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <-x$getinverse()
  
  if(!is.null(m)){ ##if the inverse has already been calculated
    message("Retrieving cached data")
    return(m)
  }
  data <- x$get() ##if the inverse has not already been calculated, this calculates the inverse
  m <- solve(data, ...)
  
  x$setinverse(m) #Sets the value of the inverse in the cache
  m #return m 
}

