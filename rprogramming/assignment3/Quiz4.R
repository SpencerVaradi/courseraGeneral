set.seed(1)
rpois(5, 2)

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(y)


library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
summaryRprof()


5

7

9

10

# Quiz 4

data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", header = TRUE)
strsplit(x = names(data), split = "wgtp")[123]

data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", header = TRUE)
str(data)
mill <- as.numeric(gsub(",","",data$X.3))
mean(mill[!is.na(mill)], na.rm = TRUE)
summary(data$Gross.domestic.product.2012)

countryNames <- as.character(unique(data$X.2))
grep("^United",countryNames)


# 4
gdp <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")[-c(1:4),]
edu <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", header = FALSE)

gdpedu <- merge(gdp,edu, by.x = "X", by.y = "CountryCode")

hasEnd <- gdpedu$Special.Notes[grepl("fiscal year end", tolower(gdpedu$Special.Notes))]
sum(grepl("june", tolower(hasEnd)))


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
library(lubridate)
a <- year(sampleTimes) == "2012"
sum(weekdays(sampleTimes[a]) == "Monday")

