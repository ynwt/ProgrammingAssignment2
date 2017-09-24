setwd("D:/YNWT/CourseRA/2. R Programming/Week3")
#Q1
tapply(iris$Sepal.Length, iris$Species, mean)
#Q2
head(iris)
rowMeans(iris)
apply(iris[, 1:4], 1, mean)
?apply(iris[, 1:4], 2, mean)
apply(iris, 1, mean)
apply(iris, 2, mean)
colMeans(iris)
#Q3
library(datasets)
data(mtcars)
head(mtcars)
mean(mtcars$mpg, mtcars$cyl)
tapply(mtcars$mpg, mtcars$cyl, mean)--
apply(mtcars, 2, mean)
sapply(mtcars, cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)--
split(mtcars, mtcars$cyl)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$cyl, mtcars$mpg, mean)
lapply(mtcars, mean)
#4
a4 <- tapply(mtcars$hp, mtcars$cyl, mean)
a4
a4[1]-a4[3]
#Q5
debug(ls)
?ls

