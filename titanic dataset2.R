library(dplyr)
library(ggplot2)

#qa


# Read the dataset
dataset <- read.csv("C:\\Users\\cusat\\Desktop\\titanic dataset\\train.csv")

# Plot the histogram of Number of parents and children of the passenger aboard (Parch)
ggplot(dataset, aes(x = Parch)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Number of Parents/Children Aboard",
       x = "Number of Parents/Children",
       y = "Count")

#qc

ggplot(dataset, aes(x = factor(Survived), y = Age, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Age Distribution of Survivors and Non-Survivors",
       x = "Survival Status",
       y = "Age") +
  scale_fill_manual(values = c("#E41A1C", "#377EB8"), name = "Survived", labels = c("No", "Yes")) +
  theme_minimal()


#qb
median_age <- median(dataset$Age, na.rm = TRUE)
dataset$Age[is.na(dataset$Age)] <- median_age

ggplot(dataset, aes(x = factor(Survived), y = Age, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Age Distribution of Survivors and Non-Survivors (with Missing Values Imputed)",
       x = "Survival Status",
       y = "Age") +
  scale_fill_manual(values = c("#E41A1C", "#377EB8"), name = "Survived", labels = c("No", "Yes")) +
  theme_minimal()

