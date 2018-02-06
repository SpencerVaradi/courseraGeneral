# 1
library(datasets)
data(iris)
tapply(iris$Sepal.Length,iris$Species, mean)


# 2
colMeans(iris)
apply(iris[,1:4],2,mean)

# 3
data(mtcars)
mean(mtcars$mpg, mtcars$cyl)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)
sapply(mtcars, cyl, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)


# 4
mean(mtcars$hp[mtcars$cyl == 8]) - mean(mtcars$hp[mtcars$cyl == 4])

# 5
debug(ls)
ls()
