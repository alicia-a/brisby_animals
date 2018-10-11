#####
# 1 - Tidying - Brisband Animal Permits
#####

# Libraries
library(tidyverse)
library(purrr)

# Read-in data
an_reg <- read_csv("data/raw/2018-10-03_Animal-permits.csv")

# Turn all variables into factors
factors <- names(an_reg)
an_fac <- an_reg %>% mutate_all(as.factor)

# Remove a few variables that only have 1 value and therefore contain no useful information
drop <- c("Permit Group", "Permit Status")
an_fac <- an_fac %>% select(-drop)

# And just because I hate having to type backticks all the time, let's make the names a bit nicer...
names(an_fac) <- c("permit_type", "breed", "suburb")

# What do we have as far as missing data is concerned?
map_dbl(an_fac, ~ sum(is.na(.)))

# We'll leave NAs in for now.
# Ok, this data is pretty tidy, so we'll just leave it there for now...

saveRDS(an_fac, "data/working/animal-permits-tidy.Rdata")
