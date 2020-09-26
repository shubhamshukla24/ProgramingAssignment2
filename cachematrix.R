## The functions cache the inverse of a matrix to avoid computing
## it repeatedly.

## This function creates a matrix that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the makeCacheMatrix,
## retrieving the inverse from the cache when possible.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
        ## Return a matrix that is the inverse of 'x'
}

## Example:
## x <- matrix(c(1,2,3,4),2,2)
## x2 <- makeCacheMatrix(x)
## cacheSolve(x2)
##       [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
