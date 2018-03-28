
R version 3.4.3 (2017-11-30) -- "Kite-Eating Tree"
Copyright (C) 2017 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> ## A pair of functions that cache the inverse of a matrix
> 
> 
> ## Creates a special matrix object that can cache its inverse
> makeCacheMatrix <- function( m = matrix() ) {
+ 
+ ## Initialize the inverse property
+     i <- NULL
+ 
+     ## Method to set the matrix
+     set <- function( matrix ) {
+             m <<- matrix
+             i <<- NULL
+     }
+ 
+     ## Method the get the matrix
+     get <- function() {
+     ## Return the matrix
+     m
+     }
+ 
+     ## Method to set the inverse of the matrix
+     setInverse <- function(inverse) {
+         i <<- inverse
+     }
+ 
+     ## Method to get the inverse of the matrix
+     getInverse <- function() {
+         ## Return the inverse property
+         i
+     }
+ 
+     ## Return a list of the methods
+     list(set = set, get = get,
+          setInverse = setInverse,
+          getInverse = getInverse)
+ }
> 
> 
> ## Compute the inverse of the special matrix returned by "makeCacheMatrix"
> ## above. If the inverse has already been calculated (and the matrix has not
> ## changed), then the "cachesolve" should retrieve the inverse from the cache.
> cacheSolve <- function(x, ...) {
+ 
+     ## Return a matrix that is the inverse of 'x'
+     m <- x$getInverse()
+ 
+     ## Just return the inverse if its already set
+     if( !is.null(m) ) {
+             message("getting cached data")
+             return(m)
+     }
+ 
+     ## Get the matrix from our object
+     data <- x$get()
+ 
+     ## Calculate the inverse using matrix multiplication
+     m <- solve(data) %*% data
+ 
+     ## Set the inverse to the object
+     x$setInverse(m)
+ 
+     ## Return the matrix
+     m
+ }
