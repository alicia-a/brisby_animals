#####
# 2 - Exploring - Brisband Animal Permits
#####

# find some data on population of suburbs, so I can do dogs/capita
# areas of suburbs to do dog density
# maps


# libraries
library(tidyverse)

# load in data
an_fac <- readRDS("data/working/animal-permits-tidy.Rdata")

# What kinds of permits are there?
levels(an_fac$permit_type)

# How many of each permit type is there?
an_fac %>% 
  group_by(permit_type) %>% 
  summarise(
    n = n()
  )

# Ok, so it's mostly dog registrations. 

# Let's just look at dog registrations
dogs <- an_fac %>% filter(permit_type == "Dog Registration")


# How many different types of dogs are there?
levels(dogs$breed)

# What type of dogs are most common in Brisbane?
dog_totals <- dogs %>% 
  group_by(breed) %>%
  summarise(n = n()) %>% 
  arrange(desc(n))

dog_totals[1:25,]

dog_totals %>% filter(breed == "Unknown")

# What suburbs have the most dogs?
suburb_totals <- dogs %>% 
  group_by(suburb) %>%
  summarise(n = n()) %>% 
  arrange(desc(n))

head(suburb_totals)
######
# Let's look at some individual breeds....

# Italian Greyhounds.
iggys <- dogs %>% filter(breed == "Italian Greyhound")

# Where do all the italian greyhounds live?
iggy_locs <- iggys %>% 
  group_by(suburb) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

head(iggy_locs)

# Weimeraner
weims <- dogs %>% filter(breed == "Weimaraner")
weim_locs <- weims %>% 
  group_by(suburb) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

# French Bulldogs
frenchies <- dogs %>% filter(breed == "French Bulldog")
frenchie_locs <- frenchies %>% 
  group_by(suburb) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

# Vizslas
vizslas <- dogs %>% filter(breed == "Hungarian Vizsla")
vizsla_locs <- vizslas %>% 
  group_by(suburb) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

head(vizsla_locs)
