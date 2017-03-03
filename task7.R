library(tidyverse)
install.packages("nycflights13")
install.packages("babynames")

# THIS IS THE FLIGHTS SECTION
#code is written by stepwise movement through the coding process
#all code is designed to be check at various point to determine that it works!

#the next two lines locate the outlier(s) and graphs it-DONE & CHECKED
nycflights13::weather %>%
  ggplot(aes(x=month, y=wind_speed)) + geom_point()

#the next batch of code shows the changed scale and excised outlier-DONE &CHECKED
nycflights13::weather %>%
  filter(wind_speed < 250) %>%
  ggplot(aes(x=month, y=wind_speed)) + geom_point()

#this code has created graphs for highest median wind speed at each direction
# for each airport DONE & CHECKED
#graph 1
NYC <- nycflights13::weather %>%
  filter(wind_speed <250) %>%
  filter(origin=="JFK")%>%
  group_by(wind_dir)%>%
  summarise(Median=median(wind_speed))%>%
  arrange(desc(Median))
NYC%>%
  ggplot(aes(x=wind_dir, y=Median)) + geom_point()
print(NYC)
#graph 2
EWR <- nycflights13::weather %>%
  filter(wind_speed <250) %>%
  filter (origin=="EWR")%>%
  group_by(wind_dir)%>%
  summarise(Median=median(wind_speed))%>%
  arrange(desc(Median))
EWR%>%
  ggplot(aes(x=wind_dir, y=Median)) + geom_point()
print(EWR)
#graph 3
LGA <- nycflights13::weather %>%
  filter(wind_speed <250) %>%
  filter (origin=="LGA")%>%
  group_by(wind_dir)%>%
  summarise(Median=median(wind_speed))%>%
  arrange(desc(Median))
LGA%>%
  ggplot(aes(x=wind_dir, y=Median)) + geom_point()
print(LGA)


#this code groups by flights origininating from JFK and lists
# median distance by carrier NAME not identifier! DONE and CHECKED!
#first filter data by JFK only and calculate mean distances flown
med_from_JFK <-nycflights13::flights %>%
  filter(origin=="JFK") %>%
  group_by(carrier)%>%
  summarise(Median=median(distance))
#now we join the table to the one with name and carrier code
carriernames <- nycflights13::airlines
carrier_table <- inner_join(med_from_JFK, carriernames)%>%
select(-carrier) #eliminates the carrier code 
print(carrier_table)


#this code sorts flights that leave Newark DONE and CHECKED!!
widedata <- nycflights13::flights %>%
  filter(origin=="EWR")%>%
  group_by(month, carrier)%>%
  summarise(Length=length(flight))%>%
  spread(month, Length)
print(widedata)

 
##now for the babynames set!
#this code filters babynames by 2014-DONE and CHECKED
babynames::babynames %>%
  filter(year==2014)

#this code groups names from above by sex and pulls the top 10 babynames-DONE and CHECKED
topten <- babynames::babynames %>%
  filter(year==2014) %>%
  group_by(sex) %>%
  slice(1:10)%>%
#now we join the tibbles to sort only by those babynames above-DONE and CHECKED
  select(name, sex) #these are the only two columns we need
toptentotal <-inner_join(topten, babynames::babynames)%>%
  ggplot(aes(x=year, y=prop, color= name)) + geom_smooth()
print (toptentotal)



#baby names for 1896, 1942, and 2016 26-29 DONE and CHECKED!
bbn1896 <- babynames::babynames %>%
  filter(sex=="F") %>%
  filter(year==1896)%>%
  arrange(desc(n))%>%
  select(-prop)%>%
  select(-sex)%>%
  slice(26:29)
bbn1942 <- babynames::babynames %>%
  filter(sex=="F") %>%
  filter(year==1942)%>%
  arrange(desc(n))%>%
  select(-prop)%>%
  select(-sex)%>%
  slice(26:29)
bbn2016 <- babynames::babynames %>%
  filter(sex=="F") %>%
  filter(year==2016)%>%
  arrange(desc(n))%>%
  slice(26:29) #note this has no values!
#now add the tibbles
bbntotal <-bind_cols(bbn1896, bbn1942)
bbntotal
 

  
  
#write a task....
#find the oldest Cessna single engine plane in nycflights13::planes
oldplane <- nycflights13::planes%>%
  filter(engines==1) %>%
  filter(manufacturer=="CESSNA")%>%
  arrange()%>%
  slice(1:1)



