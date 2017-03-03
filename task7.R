library(tidyverse)
install.packages("nycflights13")
install.packages("babynames")

nycflights13::weather %>% #test code from Drew
  group_by(wind_dir) #test code from Drew

#the next two lines locate the outlier(s) and graphs it
nycflights13::weather %>%
  ggplot(aes(x=month, y=wind_speed)) + geom_point()

#the next batch of code shows the changed scale and excised outlier
nycflights13::weather %>%
  filter(wind_speed < 250) %>%
  ggplot(aes(x=month, y=wind_speed)) + geom_point()

nycflights13::weather %>%
  filter(wind_speed <250) %>%
  group_by(origin) %>%
  median(wind_speed) %>%
  ggplot(aes(x=origin, y=wind_speed)) + geom_point


#this code filters babynames by 2014
babynames::babynames %>%
  filter (year==2014)

babynames::babynames %>%
  filter (year==2014) %>%
  ggplot(aes(x=sex, y=name)) + geom_point()



mtcars%>%ggplot(aes(x=disp, y=mpg)) + geom_point()
mtcars %>%
  group_by(cyl)
mutate(mpg.per.disp <= mpg/disp) %>%
