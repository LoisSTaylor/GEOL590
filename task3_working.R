a <- 1 #a is a double atomic vector is.double(a) and typeof(a) types and tests pg. 15
b <- 2 #b is a double atomic vector is.double(b) and typeof(b) types and tests pg. 15
c <- a + b  #c is a double atomic vector is.double(c) and typeof(b) types and tests pg.15

set.seed(0)
d <- rnorm(20) #double atomic vector is.double(d) and typeof(d) pg15
e <- rnorm(20) #double atomic vector is.double(e) and typeof(e) pg 15
f <- d + e   #double atomic vector is.double(f) and typeof (f) pg15

#three ways to use attributes to make code more reproducible (self and others)
#attributes used to store metadata
#can be thought of as a named list w/unique names p19
# 1. by adding names to the vector (during creation or by modification)
# 2. by defining factors (a vector containing pre-defined values that have...
# 2 continued: ...two attributes: class and level p21 (remember the alphabet)
# 3. by structuring the data (more info p19)

volume <- c(1:5)
attr(volume, "ml") <- "soil_water"

f1 <- factor(letters) #factor with 26 levels (the alphabet in order)
levels(f1) <- rev(levels(f1)) #this is a factor with a reverse alphabet
f2 <- rev(factor(letters)) #the alphabet is backward, the levels are forward
f3 <- factor(letters, levels = rev(letters)) #alphabet is forward, levels are reversed


#2.2.2.2. what happens to a factor when you modify it's levels?
x <- factor(c("a", "b", "c", "d"))
x[2] <- "z" #modify the 2nd level [b] to a [z]...returns a n/a for that element
# when run: [1] a <na> c d      levels: a b c d

#2.3.1.1 "dim", what and why?
# dim sets the dimensions of a defined object ie: x <- 1:12 ; dim(x) <- c(3,4)
#2.4.5.1 what attributes does a dataframe possess?
#shares properties of matrix and list p27. attributes are names
#2.4.5.2 as.matrix to a dataframe of columns of different types?
# the usual coercion heirarchy is followed: logical/int/double/complex
# ie: mixed logical-integer will give an integer matrix (from help on as.matrix)
#2.4.5.3 both no rows and no columns is possible

nrow(mtcars) #this tells us there are 32 rows to the dataframe
length(mtcars) #this tells us that a row length (single vector) contains 11 elements (or columns, here)
ncol(mtcars) #this tells us the number of columns

vec_cyl <- mtcars[c("cyl")] #this gives a plot in the global environment
mtcars$cyl #this will give the values but no plot in the environment window
mtcars[mtcars$cyl] #this isn't working

wt_3_4 <- subset(mtcars, wt<3 | wt>4) #this worked
mtcars[mtcars$cyl == 4 | 6, ] # THIS IS A TEST
mtcars[mtcars$wt<3 | mtcars$wt>4, ]


rows_mpg_and_wt <- mtcars[ ,c("mpg", "wt")]

isolate_gas_milage <- mtcars$mpg #as in line 46 this only give the data, no graph
med_milage <- median(isolate_gas_milage) #runs the median calculation 19.2
which(mtcars$mpg == med_milage)
mtcars[mtcars$mpg==median(mtcars$mpg),] #this does it in one statement
#this generates a vector of trues and falses and returns only those that are true
#if we wrapped this in a which we turn the true false vector to element numbers


mtcars[mtcars$cyl==4,] #with four cylinders only
mtcars[-1:-4] #drop firs four cars
mtcars[mtcars$cyl <=5, ]
mtcars[mtcars$cyl ==4|mtcars$cyl==6,] #cars with four or six cylinder engines




