## These two function cache the inverse of a matrix

## Creates a special matrix, which is a list containing function
## 1) Set the value of the matrix
## 2) Get the value of the matrix
## 3) Set the inverse of the matrix
## 4) Get the inverse of the matrix
makeCacheMatrix <- function(x=matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv

    list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}


## Compute the inverse of the special matrix created using makeCacheMatrix.
## If the inverse has already been calculated, gets the inverse from the cache.
## Otherwise, calculate the inverse using solve function
cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setInverse(inv)

    inv
}