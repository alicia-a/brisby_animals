#####
# 2 - Exploring
#####

# libraries
library(tidyverse)

# What kinds of permits are there?
levels(an_fac$permit_type)

# Let's just look at dog registrations
dogs <- an_fac %>% filter(permit_type == "Dog Registration")

# Ok, so it's mostly dog registrations. Let's just look at Italian Greyhounds.
iggys <- dogs %>% filter(breed == "Italian Greyhound")

# Where do all the italian greyhounds live?
iggy_locs <- iggys %>% 
  group_by(suburb) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

head(iggy_locs)

# How many different types of dogs are there?
levels(dogs$breed)
