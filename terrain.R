# First part of building an R-world
# Using the Diamond-Step algorithm
# Make a matrix with sides of 15 length (for development purposes, can get larger later)
terrain.matrix <- matrix(data = NA, nrow = 13, ncol = 13)
# the data=NA fills the whole thing with "NA"
# terrain.matrix would print out the whole matrix, but that would be huge (so don't do it)!
# need to assign values to the corners first (in this case 1,1; 1,15; 15,1; 15,15)

minrow <- (nrow(terrain.matrix) - (nrow(terrain.matrix) - 1))
maxrow <- nrow(terrain.matrix)
mincol <- (ncol(terrain.matrix) - (ncol(terrain.matrix) - 1))
maxcol <- ncol(terrain.matrix)

terrain.matrix[minrow,mincol] <- rnorm(1, 200, 200)
terrain.matrix[maxrow,mincol] <- rnorm(1, 200, 200)
terrain.matrix[minrow,maxcol] <- rnorm(1, 200, 200)
terrain.matrix[maxrow,maxcol] <- rnorm(1, 200, 200)

topleft <- terrain.matrix[minrow,mincol]
botleft <- terrain.matrix[maxrow,mincol]
topright <- terrain.matrix[minrow,maxcol]
botright <- terrain.matrix[maxrow,maxcol]

# this has set up a matrix of NAs with corner values, which is a good starting point, I guess
# what to do next?  I need to do the first diamond step to get the middle value to replace NA
# with the average of the corner values

corners <- c(topleft,botleft,topright,botright)

terrain.matrix[((minrow+maxrow)/2),((mincol+maxcol)/2)] <- 
  mean(corners)
