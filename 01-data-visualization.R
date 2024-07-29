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

# passing the mapping via geom point rather than RE species creates one line for the data set rather than discrete
# lines for each species

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")

# best practice is to change shape of dot by species as well as color given accessibility issues, etc

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")

# Uses aes to crate colorblind-friendly color scaling. Uses "Labs" to change the X and Y axis and legend info 

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

# Exercises 

# 1. How many rows are in "penguins" 

str(penguins)

# 2. What does the bill_depth_mm variable in the penguins data frame describe? 

?penguins

# Make a scatterplot of bill_depth_mm vs. bill_length_mm. That is, make a scatterplot with 
# bill_depth_mm on the y-axis and bill_length_mm on the x-axis

ggplot(
  data = penguins, 
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) + 
  geom_point()

# What happens if you make a scatterplot of species vs. bill_depth_mm? What might be a better choice of geom?

ggplot(
  data= penguins, 
  mapping = aes(x=bill_depth_mm, y= species) 
) + 
  geom_point()


ggplot(
  data = penguins, 
  mapping = aes(x= species, y = bill_depth_mm)
) + 
  geom_boxplot()

# What happens if you make a scatterplot of species vs. bill_depth_mm? What might be a better choice of geom?

# Why does the following give an error and how would you fix it?
ggplot(data = penguins) + 
  geom_point()

# What does the na.rm argument do in geom_point()? What is the default value of the argument? 
#Create a scatterplot where you successfully use this argument set to TRUE.

?ggplot2

ggplot(
  data= penguins, 
  mapping = aes(x=bill_depth_mm, y= species) 
) + 
  geom_point(
    na.rm=TRUE
  )

# Add the following caption to the plot you made in the previous exercise: “Data come from the palmerpenguins package.” 
# Hint: Take a look at the documentation for labs().

ggplot(
  data= penguins, 
  mapping = aes(x=bill_depth_mm, y= species) 
) + 
  geom_point(
    na.rm=TRUE
  ) + 
  labs( 
    caption = "data comes from the palmerpenguins package")

# Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to? 
# And should it be mapped at the global level or at the geom level?

ggplot(
  data = penguins, 
  mapping = aes(x=flipper_length_mm, y=body_mass_g)) + 
  geom_point(mapping = aes(color= bill_depth_mm)) + 
  geom_smooth(method="lm")

# 9 Run this code in your head and predict what the output will look like. 
# Then, run the code in R and check your predictions.    

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# expected this bc no mapping in points, thus three lines

# 10 Will these two graphs look different? Why/why not?

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()


#### 

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

# 1.3 ggplot2 calls 






