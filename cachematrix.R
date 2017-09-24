## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()){
  ivm <- NULL
  # getter/setter functions
  get <- function() x
  set <- function(y){
    x <<- y
    ivm <<- NULL
  }
  # getter/setter functions for inverse matrix
  setivm <- function(solve) ivm <<- solve
  getivm <- function() ivm
  # expose getter/setter functions
  list(set = set, get = get,
       setivm = setivm,
       getivm = getivm)  
}


## Write a short comment describing this function
# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
casheSolve <- function(x, ...){
  # retrieve the inverse matrix
  ivm <- x$getivm()
  # already have value return the cached value without needing to calculate again
  if(!is.null(ivm)){
    message("getting calculated cashed data")
    return(ivm)
  }
  # otherwise, get the stored matrix and inverse the matrix, store in the cache and return the inverse matrix
  data <- x$get()
  ivm <- solve(data, ...)
  #ivm <- solve(data)
  x$setivm(ivm)
  ivm
}

#-- testing
tm <- matrix(3:6, 2)
tm
cm <- makeCacheMatrix(tm)
cm
cm$get()
cm$getivm()
casheSolve(cm)
casheSolve(cm)
cm$getivm()
