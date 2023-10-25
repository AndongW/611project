album_rate <- read_csv("./source_data/albums/album_ratings.csv")
ggplot(album_rate, aes(x=`Release Year`)) +
  geom_bar()
