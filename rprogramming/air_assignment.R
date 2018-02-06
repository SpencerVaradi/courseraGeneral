
# 1
library(stringr)
pollutantmean <- function(directory, pollutant, id = 1:332){
  id <- str_pad(id,3,pad = "0")
  for (i in id) {
    if (!exists("allData")) {
      allData <- read.csv(paste0(directory,"/",i,".csv"), header = TRUE, stringsAsFactors = FALSE)
    } else {
      tmp <- read.csv(paste0(directory,"/",i,".csv"), header = TRUE, stringsAsFactors = FALSE)
      allData <- rbind(allData,tmp)
    }
  }
  return(colMeans(allData[pollutant], na.rm = TRUE))
  rm(allData)
}
pollutantmean("specdata", "sulfate")


# 2
complete <- function(directory, id = 1:332) {

  for (i in id) {
    idChr <- str_pad(i,3,pad = "0")
    if (!exists("allData")) {
      tmp <- read.csv(paste0(directory,"/",idChr,".csv"), header = TRUE, stringsAsFactors = FALSE)
      allData <- data.frame(id = i, nobs = sum(complete.cases(tmp)))
    } else {
      tmp <- read.csv(paste0(directory,"/",idChr,".csv"), header = TRUE, stringsAsFactors = FALSE)
      tmp <- data.frame(id = i, nobs = sum(complete.cases(tmp)))
      allData <- rbind(allData,tmp)
    }
  }
  return (allData)
  rm(allData)
}

complete("specdata",1:5)
complete("specdata")



corr <- function(directory, threshold = 0) {
  corrs <- vector()
  for (file in list.files(directory)) {
      data <- read.csv(paste0(directory,"/",file), header = TRUE, stringsAsFactors = FALSE)
      if (sum(complete.cases(data)) >= threshold) {
        data <- data[complete.cases(data),]
        corrs[length(corrs)+1] <- cor(data$sulfate, data$nitrate)
      } else {next}
    }
  return(corrs)

  rm(corrs)
}

head(corr("specdata",150))


# quiz 3
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("specdata", 54)
print(cc$nobs)
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

cr <- corr("specdata")
cr <- sort(cr)
set.seed(868)
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("specdata", 129)
cr <- sort(cr)
n <- length(cr)
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


pollutantmean("specdata", "sulfate", 1:10)


cr <- corr("specdata", 2000)
n <- length(cr)
cr <- corr("specdata", 1000)
cr <- sort(cr)
print(c(n, round(cr, 4)))
