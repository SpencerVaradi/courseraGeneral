url <- "http://biostat.jhsph.edu/~jleek/contact.html"
library(htmltools)
library(XML)
library(RCurl)
lines <- readLines(url)
nchar(lines[c(10,20,30,100)])
doc <- htmlToText(url)
nchar(doc$children$html$children$body$children)
unlist(doc$children$html)[10,20,30,100]
doc.text = xpathApply(doc, '//p', xmlValue)
nchar(xpathApply(doc, xmlValue))


# 5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
data <- read_fwf(url, skip=3, fwf_widths(c(9,5)
str(data)
