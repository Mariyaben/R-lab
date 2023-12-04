if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
library(tidyverse)


dataset <- read.csv("C:\\Users\\cusat\\Downloads\\train.csv")

model <- lm(SalePrice ~ LotArea, data = dataset)

cat("Intercept:", coef(model)[1], "\n")
cat("Slope:", coef(model)[2], "\n")

ggplot(dataset, aes(x = LotArea, y = SalePrice)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Linear Regression: House Prices vs. Size",
       x = "Size (square feet)",
       y = "Price")
