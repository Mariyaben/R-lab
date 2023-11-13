# Load necessary libraries
library(tidyverse)
library(ggplot2)
library(stats)

# Load the Iris dataset
iris_data <- read.csv("C:\\Users\\cusat\\Downloads\\Iris.csv")  

# Replace missing values with the median of each variable
iris_data <- iris_data %>%
  mutate_all(~ifelse(is.na(.), median(., na.rm = TRUE), .))

# a) EDA on the Iris dataset

# Summary statistics
summary(iris_data)

# Box plots for each variable by species
iris_data %>%
  gather(key = "Variable", value = "Value", -Species) %>%
  ggplot(aes(x = Species, y = Value, fill = Species)) +
  geom_boxplot() +
  facet_wrap(~Variable, scales = "free_y") +
  labs(title = "Box Plots of Iris Dataset Variables by Species")

# b) Statistical test for sepal lengths

# ANOVA test for sepal lengths between different species
anova_result <- aov(SepalLengthCm ~ Species, data = iris_data)
summary(anova_result)

# Post-hoc Tukey test for pairwise comparisons
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)

# c) Pair plot to visualize relationships between variables
pair_plot <- ggplot(iris_data, aes(x = SepalLengthCm, y = SepalWidthCm, color = Species)) +
  geom_point() +
  labs(title = "Pair Plot of Iris Dataset Variables")

print(pair_plot)
