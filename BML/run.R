source("BML.R")
source("getCarLocations.R")
source("moveCars.R")

g = createGrid(c(1000, 999), .35)
plot(g)
plot.BMLGrid(g)# same
g.out = runBML(g, 300)


# Run this for different densities of cars
rho = seq(.2, .7, length = 9)

M = 500
N = 499
end = lapply(rho, function(d) {
               g = createGrid(c(M, N), d)
               g.out = runBML(g, 300)
            })

# Visualize the results.
par(mfrow = c(3, 3))
invisible(lapply(end, plot)) # again plot.BMLgrid if S3 dispatch is not implemented.



