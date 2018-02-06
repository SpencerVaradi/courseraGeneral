# 1
data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",  header = TRUE)
head(data)
data <- tbl_df(data)
agricultureLogical <- data$ACR == 3 & data$AGS == 6
sum(agricultureLogical, na.rm= TRUE)
which(agricultureLogical)

# 2
library(jpeg)
img <- readJPEG("jeff.jpg", native = TRUE)
quantile(img, c(.30, .80))

# 3
gdp <- read.csv("gdp.csv", stringsAsFactors = FALSE, header = FALSE)
gdp <- gdp[1:231,]
edu <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", header = TRUE)
data <- merge(gdp, edu, by.x = "V1", by.y = "CountryCode")


sum(!is.na(match(gdp$V1, edu$CountryCode)))

gdp$V2 <- as.integer(gdp$V2)
gdp[order(gdp$V2, decreasing = TRUE),][1:13,]

str(data)

data <- tbl_df(data)
grouped <- group_by(data, Income.Group)
summarise(grouped, mean(V2, na.rm= TRUE))

topPoor <- filter(data, V2 <= 38, Income.Group == "Lower middle income")
