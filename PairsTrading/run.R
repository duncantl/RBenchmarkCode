
att = readData("StockData/ATT.CSV")  # T symbol
verizon = readData("StockData/VERIZON.CSV") # VZ symbol


#


overlap = combine2Stocks(att, verizon)
names(overlap)
range(overlap$Date)


#


range(att$Date)
range(verizon$Date)


#


r = overlap$att/overlap$verizon


#


plotRatio(r, k = .85, main = "ATT / Verizon, k = .85")


#


k = .85
a = findNextPosition(r, k = k)


#


b = findNextPosition(r, a[2], k = k)


#


c = findNextPosition(r, b[2], k = k)


#


symbols(a[1], r[a[1]], circles = 30, fg = "green", add = TRUE, inches = FALSE)
symbols(a[2], r[a[2]], circles = 30, fg = "red", add = TRUE, inches = FALSE)


#


plotRatio(r, k)
showPosition(a, r)
showPosition(b, r)
showPosition(c, r)


#


 pos = getPositions(r, k)
 plotRatio(r, k)
 invisible(lapply(pos, showPosition, r))


#


k = .5
pos = getPositions(r, k)
plotRatio(r, k)
showPosition(pos, r)


#


pf = positionProfit(c(1, 2), c(3838.48, 8712.87), c(459.11, 1100.65), p = 0)


#


round(pf, 2)


#


prof = positionProfit(pos, att$Adj.Close, verizon$Adj.Close, mean(r))


#


sum(prof)


#


i = 1:floor(nrow(overlap)/2)
train = overlap[i, ]
test = overlap[ - i, ]


#


r.train = train$att/train$verizon
r.test = test$att/test$verizon


#


k.max = max((r.train - mean(r.train))/sd(r.train))


#


k.min = min((abs(r.train - mean(r.train))/sd(r.train)))


#


ks = seq(k.min, k.max, length = 1000)
m  = mean(r.train)


#


profits =
   sapply(ks,
          function(k) {
              pos = getPositions(r.train, k)
              sum(positionProfit(pos, train$att, train$verizon, m))
          })


#


plot(ks, profits, type = "l")


#


ks[  profits == max(profits) ]  


#


ks = seq(1.0, 1.2, length = 100)
profits =
     sapply(ks,
            function(k) {
              pos = getPositions(r.train, k)
              sum(positionProfit(pos, train$att, train$verizon, m))
          })


#


  plot(ks, profits, type = "l")


#


ks[  profits == max(profits) ]  


#


k.star = median(ks[  profits == max(profits) ]  )


#


max(profits)


#


pos = getPositions(r.test, k.star)
sum(positionProfit(pos, test$att, test$verizon))   # our percent profit.


#


a = stockSim(rho = .99, psi = 0)


#


matplot(1:nrow(a), a, typ = "l", col = c("black", "grey"), lty = "solid")


#


a = stockSim( beta1 = c(.05, .1))


#


colMeans(a)
apply(a, 2, max)


#


x = runSim( .99, .9, c(0, 0))


#


summary(x)


#


sum(x < 0)/length(x)


#


plot(density(x))
abline(v = c(0, quantile(x, c(.25, .5, .75))), col = "red")

