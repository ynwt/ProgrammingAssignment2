# 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = numeric()){
  ivm <- NULL
  get <- function() x
  set <- function(y){
    x <<- y
    ivm <<- NULL
  }
  setivm <- function(solve) ivm <<- solve
  getivm <- function() ivm

  list(set = set, get = get,
       setivm = setivm,
       getivm = getivm)  
}

#2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#   If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
casheSolve <- function(x, ...){
  ivm <- x$getivm()
  if(!is.null(ivm)){
    message("getting calculated cashed data")
    return(ivm)
  }
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
