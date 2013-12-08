source("readAll3.R")
source("plot.R")

d = readLog("Example.log")
plot.RobotLog(d)

# showFinalLook, or more specifically, plotLook(), is written to expect a
# data frame with one row.
showFinalLook(as.data.frame(d))


# If we want to look at all 100 log files.
if(FALSE) {
par(mfrow = c(10, 10), mar = c(0, 0, 0, 0))
sapply(logs, showFinalLook, axes = FALSE, pty = "s")
}
                                                                                                     
