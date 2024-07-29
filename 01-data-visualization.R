# R for Data Science
# Data visualizaion: https://r4ds.hadley.nz/data-visualize

#Install packages
install.packages("tidyverse")
install.packages("palmerpenguins")
install.packages("ggthemes")
install.packages("ggplot2")

#Load packages
library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)

#Preview dataset penguins 
penguins

View(penguins)

# Creating an empty ggplot 

ggplot(data=penguins)

# Mapping assigns values to aesthetics of the map

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)

# Map is empty because "geom" must be called--a geometric object that represents data on the map

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

#this adds color for species--notably, this is added to the aesthetic, not the map
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()

# Since this is a new geometric object representing our data, we will add a new geom as a layer on top of our point geom: 
# geom_smooth(). And we will specify that we want to draw the line of best fit based on a linear model with method = "lm".

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")
t 