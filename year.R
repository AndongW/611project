# Load Libraries
library(tidyverse)
library(ggpubr)

# Read data
albums <- read_csv("./data/album.csv")

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
ggsave("./figures/popyear.png",plot =p1, width = 8, height = 6)
ggsave("./figures/rockyear.png",plot =p2, width = 8, height = 6)

# Pop: Heatmap for release date 
df1 <- pop %>%
  select(c(`Release Month`,`Release Day`)) %>%
  filter(!is.na(`Release Month`)) %>%
  filter(!is.na(`Release Day`)) %>%
  group_by(`Release Month`,`Release Day`) %>%
  count() 
df1$`Release Month` <- factor(df1$`Release Month`, levels = rev(c(
  "January","February","March",
  "April","May","June",
  "July","August","September",
  "October","November","December")))
df1$`Release Day` <- factor(df1$`Release Day`)
ph1 <- ggplot(df1,aes(y=`Release Month`,x=`Release Day`,fill=n)) +
  geom_tile() +
  geom_text(aes(label = n), color = "white", size = 3.5) +
  scale_fill_gradient(low = "beige", high = "red") +
  coord_fixed() +
  guides(fill = guide_colourbar(title = "Count")) +
  ggtitle("Pop: Heatmap for Release Date (Total: 3180 albums)") +
  theme(panel.background = element_blank())

# Rock: Heatmap for realease date
df2 <- rock %>%
  select(c(`Release Month`,`Release Day`)) %>%
  filter(!is.na(`Release Month`)) %>%
  filter(!is.na(`Release Day`)) %>%
  group_by(`Release Month`,`Release Day`) %>%
  count() 
df2$`Release Month` <- factor(df2$`Release Month`, levels = rev(c(
  "January","February","March",
  "April","May","June",
  "July","August","September",
  "October","November","December")))
df2$`Release Day` <- factor(df2$`Release Day`)
ph2 <- ggplot(df2,aes(y=`Release Month`,x=`Release Day`,fill=n)) +
  geom_tile() +
  geom_text(aes(label = n), color = "white", size = 3.5) +
  scale_fill_gradient(low = "beige", high = "forestgreen") +
  coord_fixed() +
  guides(fill = guide_colourbar(title = "Count")) +
  ggtitle("Rock: Heatmap for Release Date (Total: 3012 albums)") +
  theme(panel.background = element_blank())

# Export heatmaps
ggsave("./figures/popheat.png",plot =ph1, width = 10, height = 4)
ggsave("./figures/rockheat.png",plot =ph2, width = 10, height = 4)