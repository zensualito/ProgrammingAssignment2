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


## Write a short comment describing this function
#+-------------------------------------------------+
#| This function creates a special "matrix" object |
#| that can cache its inverse.                     |
#+-------------------------------------------------+
makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function
#+-----------------------------------------------------+
#| This function computes the inverse of the           |
#| special "matrix" returned by makeCacheMatrix above. |
#| If the inverse has already been calculated          |
#| (and the matrix has not changed), then cacheSolve   |
#| should retrieve the inverse from the cache.         |
#+-----------------------------------------------------+

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


