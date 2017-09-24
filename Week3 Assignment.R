#Week3 Assignment
setwd("D:/YNWT/CourseRA/2. R Programming/Week3")

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

t <- c(1,2,3,4,5)
v <- makeVector(t)
v
cachemean(v)

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


# install.packages("matlib")
# library(matlib)
# tm <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = T)
# tm
# det(tm)
# Inverse(tm)
# is_symmetric_matrix(tm)
# 
# B <- matrix( c(4, 2, 2,
#                2, 3, 1,
#                2, 1, 3), nrow=3, byrow=TRUE)
# inv(B)