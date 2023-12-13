# Load Libraries
library(tidyverse)

# Read raw ratings data
rate <- read_csv("./work/source_data/albums/album_ratings.csv")

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

# Manipulating the Score
meta_aoty_cols <- colnames(rate_genre)
meta_aoty_cols <- c(meta_aoty_cols[grepl("Meta", meta_aoty_cols)],
                    meta_aoty_cols[grepl("AOTY", meta_aoty_cols)])
rate_nona <-
  rate_genre[complete.cases(rate_genre[, meta_aoty_cols]), ]

rate_score <- rate_nona %>%
  mutate(
    meta_adj_score =
      (
        `Metacritic Critic Score` * `Metacritic Reviews` +
          `Metacritic User Score` * `Metacritic User Reviews`
      ) /
      (`Metacritic Reviews` + `Metacritic User Reviews`)
  ) %>%
  mutate(
    aoty_adj_score =
      (
        `AOTY Critic Score` * `AOTY Critic Reviews` +
          `AOTY User Score` * `AOTY User Reviews`
      ) /
      (`AOTY Critic Reviews` + `AOTY User Reviews`)
  )

# Export data
write.csv(rate_score,"./work/data/album_rate.csv")


