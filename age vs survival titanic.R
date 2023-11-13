# Assuming you've loaded the dataset into a variable named 'titanic_data'

# Load necessary libraries
library(tidyverse)
library(survminer)

# a) Plot histogram of Number of parents and children of the passenger aboard (parch)
ggplot(titanic_data, aes(x = Parch)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Number of Parents and Children Aboard",
       x = "Number of Parents and Children",
       y = "Count")

# b) Perform a detailed EDA
# Assuming survival is the target variable (1 = survived, 0 = not survived)
# You can customize this based on your dataset structure

# Summary statistics
summary(titanic_data)

# Correlation matrix
cor(titanic_data[, c("Survived", "Pclass", "Age", "SibSp", "Parch", "Fare")])

# Logistic regression for survival prediction
model <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare, 
             data = titanic_data, family = "binomial")
summary(model)

# c) Customized box plot for age distribution of survivors and non-survivors
surv_boxplot <- ggplot(titanic_data, aes(x = factor(Survived), y = Age, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Age Distribution of Survivors and Non-Survivors",
       x = "Survival Status",
       y = "Age") +
  scale_fill_manual(values = c("hotpink", "lightblue"))

print(surv_boxplot)
