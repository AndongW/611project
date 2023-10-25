# Load Libraries
library(tidyverse)

# Data Preprocessing
album_rate <- read_csv("./source_data/albums/album_ratings.csv")
album_rev1 <- read_csv("./source_data/albums/album_reviews/train.csv")
album_rev2 <- read_csv("./source_data/albums/album_reviews/test.csv")
album_rev <- rbind(album_rev1,album_rev2)

# Export data
write.csv(album_rate,"./data/album_rate.csv")
write.csv(album_rev,"./data/album_rev.csv")

