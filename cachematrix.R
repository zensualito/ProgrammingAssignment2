#+-------------------------------------------------------+
#| Matrix inversion is usually a costly computation and  |
#| there may be some benefit to caching the inverse      |
#| of a matrix rather than compute it repeatedly         |
#| (there are also alternatives to matrix inversion      |
#| that we will not discuss here).                       |
#|                                                       |
#| Computing the inverse of a square matrix can be done  |
#| with the solve function in R.                         |
#|                                                       |
#| For example, if X is a square invertible matrix,      |
#| then solve(X) returns its inverse.                    |
#|                                                       |
#| For this assignment,                                  |
#| assume that the matrix supplied is always invertible. |
#+-------------------------------------------------------+

#+-------------------------------------------------+
#| This function creates a special "matrix" object |
#| that can cache its inverse.                     |
#+-------------------------------------------------+
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() x
  
  set_inverse <- function(inversed) inverse <<- inversed
  
  get_inverse <- function() inverse
  
  list(
    set =set,
    get = get,
    set_inverse = set_inverse,
    get_inverse = get_inverse
  )
}

#+-----------------------------------------------------+
#| This function computes the inverse of the           |
#| special "matrix" returned by makeCacheMatrix above. |
#| If the inverse has already been calculated          |
#| (and the matrix has not changed), then cacheSolve   |
#| should retrieve the inverse from the cache.         |
#+-----------------------------------------------------+
cacheSolve <- function(x, ...) {
  inverse <- x$get_inverse()
  if(!is.null(inverse)) {
    message("Getting ca$hed data")
    return(inverse)
  }
  data <-x$get()
  inverse <- solve(data)
  x$set_inverse(inverse)
  inverse
}

#+-----------------------------------+
#| Example of usage:                 |
#| =================                 |
#| mdat <- matrix(c(1,3,3,           |
#|                    1,4,3,         |
#|                    1,3,4),        |
#|                  nrow=3,ncol = 3, |
#|                  byrow=TRUE)      |
#| mdat                              |
#|       [,1] [,2] [,3]              |
#| [1,]    1    3    3               |
#| [2,]    1    4    3               |
#| [3,]    1    3    4               |
#| matriz <- makeCacheMatrix(mdat)   |
#| cacheSolve(matriz)                |
#|       [,1] [,2] [,3]              |
#| [1,]    7   -3   -3               |
#| [2,]   -1    1    0               |
#| [3,]   -1    0    1               |
#| cacheSolve(matriz)                |
#| Getting ca$hed data               |
#|      [,1] [,2] [,3]               |
#| [1,]    7   -3   -3               |
#| [2,]   -1    1    0               |
#| [3,]   -1    0    1               |
#+-----------------------------------+