source("agglomerative.R")

source("eg.R")

z = hierClust(D)
z$clusters

z = hierClust(D, max)
z$clusters

z = hierClust(D, mean)
z$clusters


n = 300
d = matrix(sample(c(runif(n/3, 2, 5), runif(n/3, 3, 6), runif(n/3, .3, 1))), n, n)

z = hierClust(d)


