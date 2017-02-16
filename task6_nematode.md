---
title: "Finding Nemo(tode)s"
author: "L. Stacy Taylor"
date: "February 15, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
## Introduction
This notebook is prepared in conjunction with a class project for nematology this semester.  We have been provided two culture plates of *E. coli* lawn, each of which contains a pure culture of phoretically transferred nematodes, sourced from millipedes.  These nematodes have been sorted by size and are rather aptly named Big and Tiny; *as a note, I did not choose these names*!  Each individual species' feeding strategy is that of a bacterial feeder.  Reproduction styles and strategies are very different. Big is a hermaphrodite, lays large quantities of eggs, and reproduces very quickly.  Tiny, on the other hand, has adults of both sexes, lays very few eggs, and has an overall longer life cycle.  This project involves observing the plates daily and recording the total number of nematodes as well as total numbers of adults of boths sexes and undifferentiated juveniles.


```{r echo=FALSE}
suppressMessages(library(tidyverse))
finding_nemo <- read.csv(file="Nematode_counts_2017_updatable.csv",skip = 10)

ggplot(data=finding_nemo)+
  geom_point(mapping = aes(x=Day, y=tot.plate, color=Stage, shape=Stage), position = "jitter")
```

## Discussion

**Nematode Discussion**
The graph above shows the overall population changes in total plate counts, numbers of adults, and numbers of juveniles.  Adults are very low in comparison to juveniles, the latter of which constitutes the bulk of the population.  It is also of note that within 48 hours of the the experiment beginning juveniles began to hatch, and reached a peak on day four.  While adult populations are not zero, it is worth noting that each adult produces some 200 eggs, therefore relative population differences will be considerable.  Additionally, it can be difficult to distinguish stage-four juveniles from adults and it is entirely possible that some adults have gone missing from the counts as a result of this. Stepping aside briefly from "science-ese"....additional sources for error include attempting to count what looks for all the world like a bowl of live spaghetti.

**Graphing Discussion**
Here's where things get interesting.  This was my first major attempt at setting up an Excel file, saving to a .csv file, and then working in ggplot to create a graph that plots three sets of data on y against a single x-axis.  In order to accomplish this bit of gymnastics I had to go back and rework my data entry so that each point I wanted to graph was accounted for in the row data entry, and columns were then able to be considered as variables, and hence sorting options.  Normally, I enter my data such that one row contains a series of columns that are then plotted against each other. I'm not entirely certain that I like or could comfortably use the data entry format that I had to force my spreadsheet into in order to create the one graph that I did--it is a bit counterintuitive from my perspective.  For the moment I have elected not to graph 'Tiny' and simply experiment with the parameters of the 'Big' graphing options.  As mentioned earlier in class, this might work better in Base R.  That said, it is entirely possible *(probable?)* that I may be missing some of the not-so-subtleties here. On the other hand--I did get this to work!



