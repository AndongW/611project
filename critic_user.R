# Load Libraries
library(tidyverse)
library(ggpubr)

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

# Combine plots in one grid
p_grid1 <- ggarrange(p1,p2,p3,p4,p5,p6,ncol = 2,nrow = 3,common.legend = TRUE, legend="bottom")
ggsave("./work/figures/poprock.png",plot =p_grid1, width = 14, height = 10)

# Pop: meta critic vs user
df_p7 <- data.frame(
  value = c(
    rate_pop$`Metacritic Critic Score`,
    rate_pop$`Metacritic User Score`
  ),
  Reviewers = rep(c("1.Critics", "2.Users"),
                    times = c(
                      dim(rate_pop)[1],
                      dim(rate_pop)[1]
                    ))
)
p7 <-
  ggplot(df_p7, aes(x = value, fill = Reviewers, color = Reviewers)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Pop: Metacritic Critic vs. User") +
  theme_minimal()
p7

# Rock: meta critic vs user
df_p8 <- data.frame(
  value = c(
    rate_rock$`Metacritic Critic Score`,
    rate_rock$`Metacritic User Score`
  ),
  Reviewers = rep(c("1.Critics", "2.Users"),
                  times = c(
                    dim(rate_rock)[1],
                    dim(rate_rock)[1]
                  ))
)
p8 <-
  ggplot(df_p8, aes(x = value, fill = Reviewers, color = Reviewers)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Rock: Metacritic Critic vs. User") +
  theme_minimal()
p8

# Pop: aoty critic vs user
df_p9 <- data.frame(
  value = c(
    rate_pop$`AOTY Critic Score`,
    rate_pop$`AOTY User Score`
  ),
  Reviewers = rep(c("1.Critics", "2.Users"),
                  times = c(
                    dim(rate_pop)[1],
                    dim(rate_pop)[1]
                  ))
)
p9 <-
  ggplot(df_p9, aes(x = value, fill = Reviewers, color = Reviewers)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Pop: AOTY Critic vs. User") +
  theme_minimal()
p9

# Rock: aoty critic vs user

df_p0 <- data.frame(
  value = c(
    rate_rock$`AOTY Critic Score`,
    rate_rock$`AOTY User Score`
  ),
  Reviewers = rep(c("1.Critics", "2.Users"),
                  times = c(
                    dim(rate_rock)[1],
                    dim(rate_rock)[1]
                  ))
)
p0 <-
  ggplot(df_p0, aes(x = value, fill = Reviewers, color = Reviewers)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(name = "Score", breaks = seq(0,100,25), limits = c(0,100)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Rock: AOTY Critic vs. User") +
  theme_minimal()
p0

# Combine plots in one grid
p_grid2 <- ggarrange(p7,p9,p8,p0, ncol = 2,nrow = 2,common.legend = TRUE, legend="bottom")
ggsave("./work/figures/criticuser.png",plot =p_grid2, width = 14, height = 10)
