# Load Libraries
library(tidyverse)

# Read data 
albums <- read_csv("./work/data/album.csv")

# 
composite_score <- rowMeans(albums[,20:152],na.rm = TRUE)
albums <- albums %>%
  mutate(composite_score = composite_score)

ggplot(albums, aes(x=`Release Year`,y=composite_score,col= genre_type)) +
  geom_jitter() 

pop <- albums %>%
  filter(genre_type=="Pop")
ggplot(pop, aes(x=`Release Year`,y=composite_score,fill = as.factor(`Release Year`))) +
  geom_boxplot() +
  scale_y_continuous(name="Composite Score", limits = c(0,100)) +
  ggtitle("Pop: Composite Score over the Years") +
  theme(legend.position="none")

rock <- albums %>%
  filter(genre_type=="Rock")
ggplot(rock, aes(x=`Release Year`,y=composite_score,fill = as.factor(`Release Year`))) +
  geom_boxplot() +
  scale_y_continuous(name="Composite Score",limits = c(0,100)) +
  ggtitle("Rock: Composite Score over the Years") +
  theme(legend.position="none")

