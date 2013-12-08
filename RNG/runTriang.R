source("genTriangular.R")

# see rexp in ../Bootstrap for similar inverse CDF generation.

rtriang =
function(n, a = 0, b = 2, c = 1)
{
  u = runif(n)
  inv.triang(u, a, b, c)
}

x = rtriang(1e6)
hist(x, prob = TRUE)
summary(x)

