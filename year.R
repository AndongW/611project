# Load Libraries
library(tidyverse)

# Read data
albums <- read_csv("./work/data/album.csv")

# Make composite score based on all scores
composite_score <- rowMeans(albums[, 20:152], na.rm = TRUE)
albums <- albums %>%
  mutate(composite_score = composite_score)

# Plot pop albums composite scores by year
pop <- albums %>%
  filter(genre_type == "Pop")
p1 <- ggplot(pop, 
             aes(
               x = `Release Year`,
               y = composite_score,
               fill = as.factor(`Release Year`)
)) +
  geom_boxplot() +
  scale_y_continuous(name = "Composite Score", limits = c(0, 100)) +
  ggtitle("Pop: Composite Score over the Years") +
  theme(legend.position = "none")

# Plot rock albums composite scores by year
rock <- albums %>%
  filter(genre_type == "Rock")
p2 <- ggplot(rock,
             aes(
               x = `Release Year`,
               y = composite_score,
               fill = as.factor(`Release Year`)
             )) +
  geom_boxplot() +
  scale_y_continuous(name = "Composite Score", limits = c(0, 100)) +
  ggtitle("Rock: Composite Score over the Years") +
  theme(legend.position = "none")

# Export plots
ggsave("./work/figures/popyear.png",plot =p1, width = 8, height = 6)
ggsave("./work/figures/rockyear.png",plot =p2, width = 8, height = 6)

