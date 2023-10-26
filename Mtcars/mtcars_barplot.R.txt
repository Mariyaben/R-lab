getwd()
mtcars_data <- read.csv("mtcars.csv")
head(mtcars_data)
png("mtcars_bargraph.png", width = 864, height = 457,res=100)

mtcars_data$cyl <- as.character(mtcars_data$cyl)

table_data <- xtabs(~ am + cyl, data = mtcars_data)

barplot(table_data, beside = TRUE, col = c("red", "blue"),
        legend.text = colnames(table_data),
        xlab = "Number of Cylinders", ylab = "Count",
        main = "Cylinders vs. Transmission Type")


legend("topright", legend = unique(mtcars_data$am), fill = c("red", "blue"), title = "Transmission Type")
dev.off()
