## This function Function makeCacheMatrix gets a matrix as an input, set the value of matrix
## get the value of the matrix, set the inverse Matrix and get the inverse Matrix.

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
### makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL                                                ## initialize inv as NULL
  set <- function(y) {                                       ## define the set function
    x <<- y
    inv <<- NULL
  }
  get <- function() x                                        ##define the get fucntion
  setInv <- function(inverse) inv <<- inverse                ## assigns value of inv in parent environment
  getInv <- function() inv                                   ## gets the value of inv
  list(set = set,
       get = get,
       setInv = setInv,
       getInv = getInv)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInv(inv)
  inv
}
