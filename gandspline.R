#  Modified by rhowe to work with alvestad data 
#  http://stat.ethz.ch/R-manual/R-patched/library/stats/html/smooth.spline.html

# Run a time series analysis 4 columns of monthly SDOH JD N/S data
# Initialization
library(stats)   # location of the splines modules
library(graphics)

# put the data gands_jan_sep_2026.csv in R (user), 


###   look at the splines for ng sg ns ss SDHO hemisphere data  ####
###   read it in, save it as RData

infile <- paste(WD, "./gands_jan_sep_2026.csv", sep="/")
SDOH <- data.frame(read.csv(infile, header=TRUE))
outfile <- paste(WD, "gands_jan_sep_2026.RData", sep="/")
save(SDOH, file=outfile, ascii=FALSE)


#require(graphics)
attach(SDOH)
plot(JD, ng, main = "ng smoothing splines")
gands.spl <- smooth.spline(JD, ng)
(gands.spl)
## This example has duplicate points, so avoid cv = TRUE

lines(gands.spl, col = "blue")
lines(smooth.spline(JD, ng, df = 31), lty = 2, col = "red")
legend(7,-90,c(paste("default [C.V.] => df =",round(gands.spl$df,1)),
               "s( * , df = 31)"), col = c("blue","red"), lty = 1:2,
       bg = 'bisque')
x11()
detach()


## Residual (Tukey Anscombe) plot:
plot(residuals(gands.spl) ~ fitted(gands.spl))
abline(h = 0, col = "gray")
x11()

#require(graphics)

attach(SDOH)
plot(JD, sg, main = "sg smoothing splines")
gands.spl <- smooth.spline(JD, sg)
(gands.spl)
## This example has duplicate points, so avoid cv = TRUE

lines(gands.spl, col = "blue")
lines(smooth.spline(JD, sg, df = 31), lty = 2, col = "red")
legend(1,-100,c(paste("default [C.V.] => df =",round(gands.spl$df,1)),
               "s( * , df = 31)"), col = c("blue","red"), lty = 1:2,
       bg = 'bisque')
x11()
detach()


## Residual (Tukey Anscombe) plot:
plot(residuals(gands.spl) ~ fitted(gands.spl))
abline(h = 0, col = "gray")
x11()

#require(graphics)
attach(SDOH)
plot(JD, ns, main = "ns smoothing splines")
gands.spl <- smooth.spline(JD, ns)
(gands.spl)
## This example has duplicate points, so avoid cv = TRUE

lines(gands.spl, col = "blue")
lines(smooth.spline(JD, ns, df = 31), lty = 2, col = "red")
legend(7,-90,c(paste("default [C.V.] => df =",round(gands.spl$df,1)),
               "s( * , df = 31)"), col = c("blue","red"), lty = 1:2,
       bg = 'bisque')
x11()
detach()


## Residual (Tukey Anscombe) plot:
plot(residuals(gands.spl) ~ fitted(gands.spl))
abline(h = 0, col = "gray")
x11()

#require(graphics)

attach(SDOH)
plot(JD, ss, main = "ss smoothing splines")
gands.spl <- smooth.spline(JD, ss)
(gands.spl)
## This example has duplicate points, so avoid cv = TRUE

lines(gands.spl, col = "blue")
lines(smooth.spline(JD, ss, df = 31), lty = 2, col = "red")
legend(1,-100,c(paste("default [C.V.] => df =",round(gands.spl$df,1)),
               "s( * , df = 31)"), col = c("blue","red"), lty = 1:2,
       bg = 'bisque')
x11()
detach()


## Residual (Tukey Anscombe) plot:
plot(residuals(gands.spl) ~ fitted(gands.spl))
abline(h = 0, col = "gray")
x11()


