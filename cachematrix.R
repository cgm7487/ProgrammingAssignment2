## Put comments here that give an overall description of what your
## functions do

## use cache to store the inverse matrix of the solved matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
      x <<- y
      m <<- NULL
  }
  get <- function() x
  setInverseM <- function(matrix) m <<- matrix
  getInverseM <- function() m
  list(set = set, get = get,
       setInverseM = setInverseM,
       getInverseM = getInverseM)
}


## calculate the inverse matrix, and use cache to improve the performance

cacheSolve <- function(x, ...) {
        m <- x$getInverseM()
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
        data <- x$get()
        m <- slove(data, ...)
        x$setInverseM(m)
        
        ## Return a matrix that is the inverse of 'x'
        m
}

