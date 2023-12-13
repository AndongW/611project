# Load Libraries
library(tidyverse)

# Read raw ratings data
rate <- read_csv("./source_data/albums/album_ratings.csv")

# Remove the all duplicated entries (same artist + title)
rate_AT <- rate %>%
  select(Artist,Title)
rate <- rate[!(duplicated(rate_AT) | duplicated(rate_AT, fromLast = TRUE)), ]

# Manipulating Genre
popular_genres <- rate %>%
  group_by(Genre) %>%
  count() %>%
  arrange(desc(n))
pop_keywords <- c("hip", "pop", "singer", "folk")
rock_keywords <- c("rock", "metal", "punk", "grunge", "gaze")
rate_genre <- rate %>%
  filter(!is.na(Genre)) %>%
  mutate(pop = grepl(paste(pop_keywords, collapse = "|"), Genre, ignore.case = TRUE)) %>%
  mutate(rock = grepl(paste(rock_keywords, collapse = "|"), Genre, ignore.case = TRUE))
rate_genre$pop <-
  as.logical(rate_genre$pop - (rate_genre$Genre == "Pop Rock") - (rate_genre$Genre ==
                                                                    "Folk Rock"))
rate_genre <- rate_genre %>%
  mutate(genre_type = ifelse(pop, "Pop", ifelse(rock, "Rock", "Neither")))
table(rate_genre$genre_type)
rate_genre$`Metacritic User Score` <-
  rate_genre$`Metacritic User Score` * 10

# Export data
# write.csv(album_rate,"./data/album_rate.csv")
# write.csv(album_rev,"./data/album_rev.csv")

