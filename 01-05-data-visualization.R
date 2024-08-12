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

