source("Dist.R")
p = 50
n1 = 100
n2 = 5000
test = matrix(rnorm(n1*p), n1, p)
train = matrix(rnorm(n2*p), n2, p)

d = Dist(test, train)
