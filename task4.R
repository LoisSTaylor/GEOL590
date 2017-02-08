library(tidyverse)

#plot in a paper and evaluate
#human microbiome consortium.  Box plots are difficult to read--bit of an artistic duck
#could easily do this with facets

nrow(diamonds) #returns 53940 rows
#diamonds at the command returns the following text: a tibble: 53940 X 10
#columns are: carat, cut, color, clarity, depth, table, price, x, y, z

#explain the following code in words
set.seed(1410) 
dsmall <- diamonds[sample(nrow(diamonds), 100), ]
#random number generator. seed provides single values interpreted
#as an interger or a NULL (from help menus)
#creates a tibble 100x10
#as to what else it does, the nrows provides 100, and the comma-nothing says "all columns"
#so is the 100 rows of data just taken from a randomly picked sample of 1410 from the whole thing?

#Use  dsmall  to create the following plots: A scatterplot of  y  vs  x , colored by z values and faceted by  cut  
ggplot(data=dsmall) +
  geom_point(mapping = aes(x=x, y=y, color=z)) +
  facet_wrap(~cut)


#put the graph info up in the top...geoms are later
ggplot(data=dsmall, aes(x=carat, y=price, color=cut))+
  geom_point() +
  geom_smooth(method = "lm", se=FALSE)

#A density plot of  carat , faceted and colored by  clarity 
ggplot(data=dsmall, aes(x=carat))+
  geom_density()+
  facet_wrap(~cut)


#A boxplot of  price  as a function of  cut  
ggplot(data=dsmall, aes(x=cut, y=price)) +
  geom_boxplot()

#???A scatterplot of  y  versus  x . The points should be red ( colour = "red") 
#the color of the smoothing line should be blue ( colour = "blue" ),
#and the line should be dashed with fat dashes ( linetype=2 ). 
#set 
ggplot(data=dsmall, aes(x=x, y=y)) +
  geom_point(color='red') +
  geom_smooth(method='lm',color = 'blue', linetype=2, se=FALSE)

#ugly plot
dmedium <- diamonds[sample(nrow(diamonds), 200), ]
ggplot(data=dmedium, aes(x=carat, y=price, color=cut))+
  geom_point(mapping=aes(shape=clarity, size=2)) +
  geom_line() 
  #geom_smooth(method = "lm", se=FALSE)

  