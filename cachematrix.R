##Functions create a matrix that can cache its inverse and then calculate the inverse

## First function creates a "matrix" object that can cache its inverse

makeCacheMatrix<-function(x = matrix()){
  i <- NULL
  set <- function(y){
    x<<- y
    i<<- NULL
  }
  get <-function() x
  setInverse <- function(inverse) i<<-inverse
  getInverse <- function() i
  list(set=set, get=get,
       setInverse=setInverse,
       getInverse=getInverse)
}

## Function computes and retrieves the inverse of the "matrix" 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <-x$getInverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
data<-x$get()
m<-solve(data,...)
x$setInverse(m)
m
  }
