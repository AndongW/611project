# Load Libraries
library(tidyverse)

# Read raw data
rev1 <- read_csv("./work/source_data/albums/album_reviews/train.csv")
rev2 <- read_csv("./work/source_data/albums/album_reviews/test.csv")

# Prep for pivot
rev <- rbind(rev1, rev2)
rev_preppiv <- rev %>%
  select(-c(Review, Reception)) %>%
  distinct(Artist, Title, Source, .keep_all = TRUE)

# Pivot review data
rev_piv <- rev_preppiv %>%
  pivot_wider(names_from = Source, values_from = Rating) %>%
  mutate_all( ~ replace(., lengths(.) == 0, NA))
colnames(rev_piv) <- make.names(colnames(rev_piv))

# Export data
rev_export <- rev_piv
write_csv(rev_export,"./work/data/album_rev.csv")