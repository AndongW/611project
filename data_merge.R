# Load Libraries
library(tidyverse)

# Read data
rate <- read_csv("./work/data/album_rate.csv")
rev <- read_csv("./work/data/album_rev.csv")

# Merge/join the two datasets based on artist+title
rate_merge <- rate_score %>%
  mutate(AT = paste(Artist,Title, sep="<"))
rev_merge <- rev_piv %>%
  mutate(AT = paste(Artist,Title, sep="<")) %>%
  select(-c(Artist,Title))
albums <-  inner_join(rate_merge,rev_merge, by = "AT") %>%
  select(-AT)

# Export data
write_csv(rev_piv,"./work/data/album.csv")
