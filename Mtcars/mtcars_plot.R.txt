mtcars_data <- read.csv("mtcars.csv")
head(mtcars_data)
png("mtcars_output.png", width = 864, height = 457,res=100)


plot(mtcars_data$disp, mtcars_data$mpg, xlab = "Displacement (cu. in.)", ylab = "Miles per Gallon",
     main = "Miles per Gallon vs Displacement")


points(mtcars_data$disp[mtcars_data$cyl == 4], mtcars_data$mpg[mtcars_data$cyl == 4], col = "red", pch = 1)
points(mtcars_data$disp[mtcars_data$cyl == 6], mtcars_data$mpg[mtcars_data$cyl == 6], col = "blue", pch = 2)
points(mtcars_data$disp[mtcars_data$cyl == 8], mtcars_data$mpg[mtcars_data$cyl == 8], col = "green", pch = 3)

abline(lm(mpg ~ disp, data = mtcars_data), col = "purple")  

legend("topright", legend = unique(mtcars_data$cyl), col = c("red", "blue", "green"), pch = 1:3, title = "Cylinders")
dev.off()
