x <- 5 + 7

x
y <- x - 3
y
z <- c(1.1,9,3.14)
?c
z
c(z,555,z)
z * 2 + 1000
my_sqrt <- sqrt(z - 1)
my_sqrt
my_div <- z/my_sqrt
my_div
c(1,2,3,4) + c(0,10)
c(1,2,3,4) + c(0,10,1000)

# 2
getwd()
ls()
x <- 9
ls()
list.files()
?list.files
args(list.files)
old.dir <- getwd()
dir.create("testdir")
setwd("testdir")
file.create("mytest.R")
list.files()
file.exists("mytest.R")
file.info("mytest.R")
file.rename("mytest.R", "mytest2.R")
file.remove("mytest.R")
file.copy("mytest2.R","mytest3.R")
file.path("mytest3.R")
file.path('folder1','folder2', recursive = TRUE)
?dir.create
dir.create(file.path('testdir2','testdir3'), recursive = TRUE)
setwd(old.dir)

# 3

1:20
pi:10
15:1
help(":")
?`:`
seq(0,10, by=0.5)
my_seq <- seq(5,10, length = 30)
length(my_seq)
1:length(my_seq)
seq(along.with=my_seq)
seq_along(my_seq)
rep(0,times = 40)
rep(c(0,1,2), times=10)
rep(c(0,1,2), each=10)

# 4
num_vect <- c(0.5,55,-10,6)
tf <- num_vect < 1
num_vect >= 6

my_char <- c("My","name","is")
my_char
paste(my_char, collapse = " ")
my_name <- c(my_char,"Spence")
my_name
paste(my_name, collapse=" ")
paste("Hello","world!", sep=" ")
paste(1:3, c("X","Y","Z"), sep = "")
paste(LETTERS, 1:4, sep = "-")
x <- c(44,NA,5,NA)
x * 3
y <- rnorm(1000)
z <- rep(NA,1000)
my_data <- sample(c(y,z),100)
my_na<-is.na(my_data)
my_na
my_data == NA
sum(my_na)
my_data
0/0
Inf - Inf

# 6
x
x[1:10]
x[is.na(x)]
y <- x[!is.na(x)]
y
y[y>0]
x[x>0]
x[!is.na(x) & x > 0]
x[c(3,5,7)]
x[0]
x[3000]
x[c(-2,-10)]
x[-c(2,10)]
vect <- c(foo=11, bar=2, norf = NA)
vect
names(vect)
vect2 <- c(11,2,NA)
names(vect2) <- c("foo","bar","norf")
identical(vect, vect2)
vect["bar"]
vect[c("foo","bar")]

# 7
my_vector <- 1:20
my_vector
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4,5)
dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix <- my_vector
?matrix
my_matrix2 <- matrix(data = 1:20, nrow = 4, ncol = 5)
identical(my_matrix, my_matrix2)
patients <- c("Bill","Gina","Kelly","Sean")
cbind(patients,my_matrix)
my_data <- data.frame(patients, my_matrix)
my_data
class(my_data)
cnames <- c("patient","age","weight","bp","rating","test")
colnames(my_data) <- cnames
my_data

# 8
TRUE == TRUE
(FALSE == TRUE) == FALSE
6 == 7
6 < 7
10 <= 10
5 !=7
!(5 == 7)
FALSE & FALSE
TRUE && c(TRUE,FALSE,FALSE)
TRUE || c(TRUE,FALSE,FALSE)
5 > 8 ||6 != 8 && 4 > 3.9
xor(5 == 6, !FALSE)
ints <- sample(10)
ints
ints > 5
which(ints > 7)
any(ints < 0)
all(ints > 0)


# 9

Sys.Date()
mean(c(2,4,5))
boring_function('My first function!')
boring_function
my_mean(c(4,5,10))
remainder(5)
remainder(11,5)
remainder(divisor = 11, num = 5)
remainder(4, div = 2)
args(remainder)
evaluate(sd, c(1.4, 3.6, 7.9, 8.8))
evaluate(function(x){x+1},6)
evaluate(function(x){x[length(x)]}, c(8,4,0))
?paste
paste("Programming","is","fun!")
telegram("fwef")
mad_libs("eerie","smooth","donkey")
'I' %p% 'love' %p% 'R!'

# 14
d1 <- Sys.Date()
class(d1)
unclass(d1)
d1
d2 <- as.Date("1969-01-01")
unclass(d2)
t1 <- Sys.time()
t1
class(t1)
unclass(t1)
t2 <- as.POSIXlt(Sys.time())
class(t2)
t2
unclass(t2)
str(unclass(t2))
t2$min
weekdays(d1)
months(t1)
quarters(t2)
t3 <- "October 17, 1986 08:24"
strptime(t3, "%B %d, %Y %H:%M")
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4
class(t4)
Sys.time() > t1
Sys.time()-t1
difftime(Sys.time(), t1, units = "days")



# 10
class(flags)
cls_list <- lapply(flags, class)
cls_list
class(cls_list)
as.character(cls_list)
cls_vect <- sapply(flags, class)
class(cls_vect)
sum(flags$orange)
flag_colors <- flags[,11:17]
head(flag_colors)
sapply(flag_colors, sum)
sapply(flag_colors, mean)
flag_shapes <- flags[,19:23]
shape_mat <- sapply(flag_shapes, range)
shape_mat
class(shape_mat)
unique(c(3,4,5,5,5,6,6))
unique_vals <- lapply(flags, unique)
unique_vals
sapply(unique_vals, length)
sapply(flags, unique)
lapply(unique_vals, function(elem) elem[2])


# 11
sapply(flags, unique)
vapply(flags, unique, numeric(1))
ok()
sapply(flags, class)
vapply(flags, class, character(1))
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate, flags$landmass, mean)
tapply(flags$population, flags$red, summary)
tapply(flags$population, flags$landmass, summary)


# Rprogramming 12
ls()
class(plants)
dim(plants)
nrow(plants)
ncol(plants)
object.size(plants)
names(plants)
head(plants)
head(plants, 10)
tail(plants, 15)
summary(plants)
table(plants$Active_Growth_Period)
str(plants)


# 13
?sample
sample(1:6, 4, replace = TRUE)
sample(1:20, 10)
LETTERS
sample(LETTERS)
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3,0.7))
flips
sum(flips)
?rbinom
rbinom(1, size = 100, prob = 0.7)
flips2 <- rbinom(size = 1, n = 100, prob = 0.7)
flips2
sum(flips2)
?rnorm
rnorm(10)
rnorm(10, mean = 100, sd = 25)
rpois(n = 5, lambda = 10)
my_pois <- replicate(100, rpois(5,10))
my_pois
cm <- colMeans(my_pois)
hist(cm)


# 15
data(cars)
?cars
head(cars)
plot(cars)
?plot
plot(cars$speed, cars$dist)
plot(cars$dist, cars$speed)
plot(cars$speed, cars$dist, xlab = "Speed")
plot(cars$speed, cars$dist, ylab = "Stopping Distance")
plot(cars$speed, cars$dist, xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot")
plot(cars, sub = "My Plot Subtitle" )
plot(cars, col = 2)
plot(cars, xlim = c(10,15))
plot(cars, pch = 2)
data(mtcars)
?boxplot
boxplot(mpg ~ cyl, data = mtcars)
hist(mtcars$mpg)

# 4 Cleaning
Sys.getlocale("LC_TIME")
library(lubridate)
help(package = lubridate)
today()
this_day <- today()
this_day
month(this_day)
wday(this_day)
wday(this_day, label = TRUE)
this_moment <- now()
this_moment
hour(this_moment)
my_date <- ymd("1989-05-17")
my_date
class(my_date)
ymd("1989 May 17")
mdy("March 12, 1975")
dmy(25081985)
ymd("192012")
ymd("1920/1/2")
dt1
ymd_hms(dt1)
hms("03:22:14")
dt2
ymd(dt2)
update(this_moment, hours = 8, minutes = 34, seconds = 55)
this_moment
this_moment <- update(this_moment, hours = 10, minutes = 16, seconds = 0)
this_moment
nyc <- now("America/New_York")
nyc
depart <- nyc + days(2)
depart
depart <- update(depart, hours = 17, minutes = 34)
depart
arrive <- depart + hours(15) + minutes(50)
?with_tz
arrive <- with_tz(arrive, "Asia/Hong_Kong")
arrive
last_time <- mdy("June 17, 2008", tz = "Singapore")
last_time
?interval
how_long <- interval(last_time, arrive)
as.period(how_long)
stopwatch()
