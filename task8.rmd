---
title: "Task 8 functions"
author: "L. Stacy Taylor"
date: "March 14, 2017"
output:
  html_document: default
  html_notebook: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r echo=FALSE}
suppressMessages(library(tidyverse))
suppressMessages(library(babynames))
```


## Introduction
This notebook is designed to practice writing functions.  Some of the following code is for the purpose of practice and building the way to the function...some is actually the assignment.

To practice building a function, I will first create a specific function designed to use data from the mtcars dataframe.  This function adds the second and third columns (mpg and cyl). This creates a new column in the mtcars dataframe named *practice*.

```{r echo=TRUE}
mpgs_plus_cyls <- function(mtcars, mpg, cyl){
  test1 <- mtcars %>%
    mutate(practice=mpg+cyl)
  return(test1)
  
}

```
This next bit of code is the generic function independent of dataframe (ie: dataframe specified by the user) but can do the same thing with the command df_col_adder(mtcars, mtcars$mpg, mtcars$cyl).  Now, the interesting thing is that while this code does work for this much of the assignment, I could not make it work for renaming the final column nor for the creation of NAs in the case of invalid data entry.

```{r echo=TRUE}
df_col_adder2 <- function(dftbd, col1, col2){
  test2 <- mutate(dftbd, practice=col1+col2)
  return(test2)
  
}
```
Now let's try specifying the name of the final column via user and putting in an error message.  This ultimately required totally different code. Data is now entered as: df_col_adder3(mtcars, mtcars$mpg, mtcars$cyl, "pick_a_name")

```{r echo=TRUE}
df_col_adder3 <- function(dftbd, col1, col2, newcol){
  if(is.data.frame(dftbd)==FALSE){
    warning("one of these is not a dataframe")
  }
  
  col3 <- col1 + col2
  newdf <- cbind.data.frame(dftbd, col3)
  colnames(newdf)[length(colnames(newdf))] <- newcol
  #length tells you the number of columns, and chooses the last one
  return(newdf) 
}

```


##The For Loop##
This next bit of code simply creates a vector, length 1 to 10^4 and sums the components.  This is NOT what we're trying to accomplish here, but here is the code, nonetheless.

```{r echo=TRUE}
tvec <- c(1:10^4)
tvecsum <- sum(tvec)
```
Now...we're going to accomplish the same thing by using a function with a for loop rather than simply using the sum command. Note that the sum command is still called, so in effect you are creating a loop to execute individual additions (which is needlessly complicated).

```{r echo=TRUE}
tvec <-c(1:10^4)
your_fun <- function(tvec){
  
  for(i in 1:length(tvec)){
    tvecsum2 <- sum(tvec)
  }
}

```
Now we run this function through microbenchmark to see what happens....


```{r echo=TRUE}
library(microbenchmark)
test.vec <- 1:10^4
microbenchmark(
    your_fun(tvec),
    sum(test.vec)
    )
```
Suffice it to say that the straight summation is considerably faster than attempting to run the for loop function!
