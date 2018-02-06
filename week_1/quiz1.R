# 1
data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", header = TRUE)
unique(data$VAL)
sum(data$VAL == "24", na.rm = TRUE)


# 2

# 3
library(xlsx)
data <- read.xlsx("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx")


# 4
library(XML)
xmlfile <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternalNodes = TRUE)
xmltop <- xmlRoot(xmlfile)
xmlName(xmltop)
names(xmltop)
xmltop[[1]][[1]]
xmlSApply(xmltop,xmlValue)
sum(xpathSApply(xmltop, "//zipcode",xmlValue) == "21231")


xml_data <- xmlToList(xmlfile)



df <-

dataRaw <- xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue))
data <- data.frame(t(dataRaw),row.names=NULL)
luckyData <- xmlToDataFrame(xmlfile[[1]][["row"]])

grep("21231", xmltop)


