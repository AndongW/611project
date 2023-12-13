# Load Libraries
library(tidyverse)

# Read raw ratings data
rate <- read_csv("./source_data/albums/album_ratings.csv")

# Remove the all duplicated entries (same artist + title)
rate_AT <- rate %>%
  select(Artist,Title)

rate <- rate[!(duplicated(rate_AT) | duplicated(rate_AT, fromLast = TRUE)), ]



# Export data
write.csv(album_rate,"./data/album_rate.csv")
write.csv(album_rev,"./data/album_rev.csv")

