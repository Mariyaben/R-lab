getwd()
iris_data <- read.csv("iris.csv")
head(iris_data)


png("iris_scatterplot_output.png", width = 864, height = 457,res=100)


plot(iris_data$sepal_length, iris_data$petal_length, 
     xlab = "Sepal Length", ylab = "Petal Length",
     main = "Scatterplot of Sepal Length vs Petal Length")

points(iris_data$sepal_length[iris_data$species == "setosa"], iris_data$petal_length[iris_data$species == "setosa"], col = "red", pch = 1)
points(iris_data$sepal_length[iris_data$species == "versicolor"], iris_data$petal_length[iris_data$species == "versicolor"], col = "blue", pch = 2)
points(iris_data$sepal_length[iris_data$species == "virginica"], iris_data$petal_length[iris_data$species == "virginica"], col = "green", pch = 3)


legend("topright", legend = unique(iris_data$species), col = c("red", "blue", "green"), pch = 1:3, title = "Species")
dev.off()
