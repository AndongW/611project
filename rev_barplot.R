album_rev1 <- read_csv("./source_data/albums/album_reviews/train.csv")
album_rev2 <- read_csv("./source_data/albums/album_reviews/test.csv")
album_rev <- rbind(album_rev1,album_rev2)
cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#F0E442", "#009E73", "#0072B2", "#D55E00", "#CC79A7")

ggplot(album_rev, aes(x=Rating, fill = Reception)) +
  geom_histogram(binwidth = 1) +
  scale_fill_manual(values=cbPalette)
