# Analyze  numeric data values in your data set by constructing at least two 
# of the following data visualizations: box plots, stem and leaf plots, 
# dot plots, scatter plots, time series plots, histograms, frequency polygons, ogives.

# Analyze categorical data values in your data set by constructing at least two 
# of the following data visualizations: bar plots, segmented bar plots, and pie charts. 

# Load packages
library(tidyverse)
library(ggplot2)

# Load penguins_clean.rds from Week 2 checkpoint
penguins_clean <- readRDS(file = "penguins_clean.rds")

# Update x-axis labels 
penguins_clean$species <- factor(penguins_clean$species, 
                                 labels = c("Adelie", 
                                            "Chinstrap", 
                                            "Gentoo"))

# Scatter plot culmen_length_mm x culmen_depth_mm color by species
posn_j <- position_jitter(0.1,
                          seed = 666)
ggplot(penguins_clean,
       aes(x = culmen_length_mm,
           y = culmen_depth_mm,
           color = species)) +
  geom_point(position = posn_j, alpha = 0.7, size = 5) +
  labs(title="Culmen Length (mm) vs. Culmen Length (mm) by species",
       x = "Culmen Length (mm)",
       y = "Culmen Depth (mm)") +
  scale_color_discrete("Species") +
  theme_classic()
  
# Boxplot of body mass by species
ggplot(penguins_clean, 
       aes(x=species, 
           y=body_mass_g, 
           fill=species)) +
  geom_boxplot() +
  labs(title = "Body Mass by Species", 
       x = "Species", 
       y = "Body Mass (g)") +
  theme_classic()

# Stacked density plots of body_mass_g colored by species
ggplot(penguins_clean, aes(x=body_mass_g, fill=species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Stacked Density Plots of Body Mass by Species", x = "Body Mass (g)", y = "Density") +
  theme_classic() +
  scale_y_continuous(labels = scales::comma)

# Stacked density plots of culmen_length_mm colored by species
ggplot(penguins_clean, aes(x=culmen_length_mm, fill=species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Stacked Density Plots of Culmen Length (mm) by Species", x = "Culmen Length (mm)", y = "Density") +
  theme_classic() +
  scale_y_continuous(labels = scales::comma)

# Stacked density plots of culmen_depth_mm colored by species
ggplot(penguins_clean, aes(x=culmen_depth_mm, fill=species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Stacked Density Plots of Culmen Depth (mm) by Species", x = "Culmen Depth (mm)", y = "Density") +
  theme_classic() +
  scale_y_continuous(labels = scales::comma)

# Segmented bar plot of species by island
ggplot(penguins_clean, aes(x = island, fill = species)) +
  geom_bar(position = "stack") +
  labs(title = "Segmented Bar Plot of Species Counts by Island", x = "Island", y = "Count") +
  theme_classic()

# Write new csv and rds files
write.csv(penguins_clean, "penguins_clean_w3.csv") # does not preserve variable structure
write_rds(penguins_clean, "penguins_clean_w3.rds") # preserves variable structure