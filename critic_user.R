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

# Plot AOTY Adjusted Score: Pop vs. Rock
df_p2 <- data.frame(
  value = c(
    rate_pop$aoty_adj_score,
    rate_rock$aoty_adj_score
  ),
  Genre_group = rep(c("1.Pop", "2.Rock"),
                    times = c(
                      length(rate_pop$aoty_adj_score),
                      length(rate_rock$aoty_adj_score)
                    ))
)
p2 <-
  ggplot(df_p2, aes(x = value, fill = Genre_group, color = Genre_group)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "AOTY Adjusted Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") +
  ggtitle("AOTY Adjusted Score: Pop vs. Rock") +
  theme_minimal()
p2

# Plot Metacritic Critic Score
df_p3 <- data.frame(
  value = c(
    rate_pop$`Metacritic Critic Score`,
    rate_rock$`Metacritic Critic Score`
  ),
  Genre_group = rep(c("1.Pop", "2.Rock"),
                    times = c(
                      dim(rate_pop)[1],
                      dim(rate_rock)[1]
                    ))
)
p3 <-
  ggplot(df_p3, aes(x = value, fill = Genre_group, color = Genre_group)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "Metacritic Critic Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Metacritic Critic Score: Pop vs. Rock") +
  theme_minimal()
p3

# Plot AOTY Critic Score
df_p4 <- data.frame(
  value = c(
    rate_pop$`AOTY Critic Score`,
    rate_rock$`AOTY Critic Score`
  ),
  Genre_group = rep(c("1.Pop", "2.Rock"),
                    times = c(
                      dim(rate_pop)[1],
                      dim(rate_rock)[1]
                    ))
)
p4 <-
  ggplot(df_p4, aes(x = value, fill = Genre_group, color = Genre_group)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "AOTY Critic Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("AOTY Critic Score: Pop vs. Rock") +
  theme_minimal()
p4

# Plot Metacritic User Score
df_p5 <- data.frame(
  value = c(
    rate_pop$`Metacritic User Score`,
    rate_rock$`Metacritic User Score`
  ),
  Genre_group = rep(c("1.Pop", "2.Rock"),
                    times = c(
                      dim(rate_pop)[1],
                      dim(rate_rock)[1]
                    ))
)
p5 <-
  ggplot(df_p5, aes(x = value, fill = Genre_group, color = Genre_group)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "Metacritic User Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Metacritic User Score: Pop vs. Rock") +
  theme_minimal()
p5

# Plot AOTY User Score
df_p6 <- data.frame(
  value = c(
    rate_pop$`AOTY User Score`,
    rate_rock$`AOTY User Score`
  ),
  Genre_group = rep(c("1.Pop", "2.Rock"),
                    times = c(
                      dim(rate_pop)[1],
                      dim(rate_rock)[1]
                    ))
)
p6 <-
  ggplot(df_p6, aes(x = value, fill = Genre_group, color = Genre_group)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "AOTY User Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("AOTY User Score: Pop vs. Rock") +
  theme_minimal()
p6


