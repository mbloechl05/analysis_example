# -------------------------------------------
# Example script 
# Workshop: Git for Psychological Research
# -------------------------------------------

# To demonstrate how to use version control, we will compute a correlation 
# coefficient using simulated data


# 0.) install and load packages

# uncomment the following line if you haven't installed the MASS package
# install.packages(MASS) 
library("MASS")


# 1.) simulate data

samples = 100 # number of samples to draw
r = 0.70 # pre-specified correlation coefficient

data = mvrnorm(n=samples, mu=c(0, 0), # draw # of samples from multivar norm distribution
               Sigma=matrix(c(1, r, r, 1), nrow=2), # specifiy correlation matrix
               empirical=TRUE) 

x = data[, 1]  # standard normal (mu=0, sd=1)
y = data[, 2]  # standard normal (mu=0, sd=1)


# 2.) calculate correlation coefficient

cor(x, y)


# 3.) plot data

plot(x,y)
abline(lm(x ~ y))


#alternative plot-Version
library(tidyverse)
daten <- data.frame(data)

ggplot(daten, aes(x = X1, y = X2)) +
  geom_point() +
  geom_smooth(method = "lm")

            