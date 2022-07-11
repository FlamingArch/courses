# Install Package
# install.packages("ggplot2")

# Load Package
library("ggplot2")

# Plot : Scatter Plot (using qplot)
# =================================

# Make Data
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1) # c() = Concatenate
print(x)

y <- x^3
print(y)

# Scatter Plot
qplot(x,y)

# Plot : Histogtam (using qplot)
# ==============================

# Make Data
x <- c(1,2,2,2,3,3)
qplot(x, binwidth=1)


#======================
# EXCERSICE 1 (Page 27)
#======================
# Ques: Let x3 be the following vector:
x3 <- c(0,1,1,2,2,2,3,3,4)
# Imagine what a histogram of x3 would look like Assume that the histogram has a
# bin width of 1. 
#
# How many bars will the histogram have? 
# Where will they appear? 
# How high will each one be?
#
# When you're done, plot a histogram of x3 with binwidth=1 and see if you are
# right.
#
# Ans: 
# The histogram will have 5 bars.
# The'll appear in x-Axis spanning to a height in y axis according to the value.
# Each one will be