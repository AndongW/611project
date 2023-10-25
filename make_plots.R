# Read in data
album_rate <- read_csv("./work/611project/data/album_rate.csv")
album_rev <- read_csv("./work/611project/data/album_rev.csv")

# Plot 1
rate_barplot <- ggplot(album_rate, aes(x=`Release Year`)) +
  geom_bar()

ggsave("./work/611project/figures/rate_barplot.png",plot =rate_barplot)

# Plot 2
cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#F0E442", "#009E73", "#0072B2", "#D55E00", "#CC79A7")

rev_barplot <- ggplot(album_rev, aes(x=Rating, fill = Reception)) +
  geom_histogram(binwidth = 1) +
  scale_fill_manual(values=cbPalette)

ggsave("./work/611project/figures/rev_barplot.png",plot =rev_barplot)