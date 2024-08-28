# start w/ 1.5 visualizing relationships 
# https://r4ds.hadley.nz/data-visualize#visualizing-relationships

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

str(penguins)

# boxplot displaying masses of each species side-by-side

ggplot(penguins, aes(x = species, y = body_mass_g, color=species)) +
  geom_boxplot()

#try the same thing but with density 

ggplot(penguins, aes(x = body_mass_g, color=species)) +
  geom_density(linewidth =0.75)


# in this exapmle, the alpha argument colors the fill  and makes the color transparent on a scale
# between 0 (completely transparent) and 1 (completely opaque)

ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.25)

# terminology 

# We ***map*** variables to aesthetics if we want the visual attribute represented by 
# that aesthetic to vary based on the values of that variable

# Otherwise, we ***set*** the value of an aesthetic.

# plot of frequencies 

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

# scatterplot still most common visualization for relationship between two numerical variables

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# we can incorporate more variables into a plot by mapping them to additional aesthetics.
# in the following scatterplot the colors of points represent species and the shapes of points represent islands.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

# However adding too many aesthetic mappings to a plot makes it cluttered and 
# difficult to make sense of

# consider faceting, eg

# The first argument of facet_wrap() is a formula3, which you create with ~ 
# followed by a variable name. The variable that you pass to facet_wrap() should 
# be categorical.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

# exercises 1.5.5

# 1.  how many variables categorical vs. numeric
?mpg
mpg
head(mpg)
# 7 are categorical(?)

#2. Make a scatterplot of hwy vs. displ using the mpg data frame. Next, map a third, 
# numerical variable to color, then size, then both color and size, then shape. 
# How do these aesthetics behave differently for categorical vs. numerical variables?

ggplot(mpg, aes(x = hwy, y = displ)) + 
  geom_point()


ggplot(mpg, aes(x = hwy, y = displ)) + 
  geom_point(aes(shape=model, color=model))

#3. In the scatterplot of hwy vs. displ, what happens if you map a third variable to linewidth

ggplot(mpg, aes(x = hwy, y = displ, linewidth = cyl)) + 
  geom_point() 

#4 see 2 above (mapping same variable to different aesthetics)

#5 Make a scatterplot of bill_depth_mm vs. bill_length_mm and color the points by species. 
# What does adding coloring by species reveal about the relationship between these two variables? 
# What about faceting by species?
str(penguins)

ggplot(penguins, aes(x=bill_depth_mm, y=bill_length_mm)) + 
  geom_point(aes(color=species)) + 
  facet_wrap(~species)

# 6 Why does the following yield two separate legends? How would you fix it to 
# combine the two legends?

# (answ: fix capitalization)

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "species")
 
# Create the two following stacked bar plots. Which question can you answer with 
# the first one? Which question can you answer with the second one?

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill") #percentageof species by island 

ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill") #which island each species lives on 

# ggsave() saves a plot in a specified path. important for reproducible code 

# ggsave() exercises

# 1. ggplot(mpg, aes(x = class)) +
ggplot(mpg, aes(x = class)) +
  geom_bar()

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()

ggsave("mpg-plot.pdf")

?ggsave
