# Load Libraries
library(tidyverse)

# Read data 
albums <- read_csv("./work/data/album.csv")

# Split data
rate_pop <- albums %>%
  filter(genre_type == "Pop")
rate_rock <- albums %>%
  filter(genre_type == "Rock")
rate_other <- albums %>%
  filter(genre_type == "Neither")

# Plot Metacritic Adjusted Score: Pop vs. Rock
df_p1 <- data.frame(
  value = c(
    rate_pop$meta_adj_score,
    rate_rock$meta_adj_score
  ),
  Genre_group = rep(c("1.Pop", "2.Rock"),
                    times = c(
                      length(rate_pop$meta_adj_score),
                      length(rate_rock$meta_adj_score)
                    ))
)
p1 <-
  ggplot(df_p1, aes(x = value, fill = Genre_group, color = Genre_group)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "Metacritic Adjusted Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Metacritic Adjusted Score: Pop vs. Rock") +
  theme_minimal()
p1