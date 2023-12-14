# Load Libraries
library(tidyverse)

# Read data
rate <- read_csv("./data/album_rate.csv")
rev <- read_csv("./data/album_rev.csv")

# Merge/join the two datasets based on artist+title
rate_merge <- rate %>%
  mutate(AT = paste(Artist,Title, sep="<"))
rev_merge <- rev %>%
  mutate(AT = paste(Artist,Title, sep="<")) %>%
  select(-c(Artist,Title))
albums <-  inner_join(rate_merge,rev_merge, by = "AT") %>%
  select(-AT)

# Make composite score based on all scores
composite_score <- rowMeans(albums[, 20:152], na.rm = TRUE)
albums <- albums %>%
  mutate(composite_score = composite_score)

# Export data
write_csv(albums,"./data/album.csv")
