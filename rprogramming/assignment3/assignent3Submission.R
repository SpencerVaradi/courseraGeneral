setwd("assignment3")

hospitals_origin <- read.csv("hospital-data.csv", header = TRUE, stringsAsFactors = FALSE)
outcomes_origin <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
hospitals <- hospitals_origin
outcomes <- outcomes_origin

names(outcome)

# 1
outcomes[, 11] <- as.numeric(outcome[, 11])
hist(outcomes[, 11])


# 2
simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}
outcome <- "heart attack"
state <- "PA"
library(dplyr)


prefix <- "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from."
outcome <- paste0(prefix, gsub(" ", ".", simpleCap(outcome)))
outcomes_tmp <- outcomes
outcomes_tmp[outcome] <- as.numeric(outcomes_tmp[outcome][[1]])

outcomes_tmp <- tbl_df(outcomes_tmp)
bestList <- outcomes_tmp %>%
  select(Hospital.Name, State, UQ(outcome)) %>%
#  mutate_(outcome = as.numeric(outcome)) %>%
  filter(State == state) %>%
  arrange_(outcome, "Hospital.Name")
return (bestList$Hospital.Name[1])


outcomes_tmp <- outcomes[outcomes$State == state]
outcomes_tmp$Hospital.Name[match(min(outcomes_tmp[outcome]), outcomes_tmp[outcome])]



# 3
rankhospital <- function(state, outcome, num = "best") {
  outcomes_origin <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
  outcomes <- outcomes_origin

  prefix <- "Hospital.30.Day.Death..Mortality..Rates.from."
  outcome <- paste0(prefix, gsub(" ", ".", simpleCap(outcome)))
  outcomes_tmp <- outcomes
  if (!outcome %in% names(outcomes_tmp)) {
    stop("invalid outcome")
  } else {
    if (!state %in% outcomes_tmp$State) {
      stop("invalid state")
    } else {
      outcomes_tmp[outcome] <- as.numeric(outcomes_tmp[outcome][[1]])

      outcomes_tmp <- tbl_df(outcomes_tmp)
      bestList <- outcomes_tmp %>%
        select(Hospital.Name, State, UQ(outcome)) %>%
        #  mutate_(outcome = as.numeric(outcome)) %>%
        filter(State == state) %>%
        arrange_(outcome, "Hospital.Name")

  if (num == "worst") {
    num <- nrow(bestList)
  }
  if(num == "best"){
    num <- 1
  }
      return (bestList$Hospital.Name[num])
    }
  }
}
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("GU", "heart attack", 5)

rankall <- function(outcome, num = "best") {
  outcomes_origin <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
  outcomes <- outcomes_origin

  rankedDF <- data.frame(hospital = character(0),state = character(0))
  # names(rankedDF) <- c("hospital" = NULL,"state" = NULL)

  for (state in sort(unique(sort(outcomes$State)))){
    stateRank <- rankhospital(state, outcome, num)
    rankedDF <- rbind(rankedDF, data.frame(hospital = as.character(stateRank), state = as.character(state)))
  }
  return(rankedDF)
}
head(rankall("heart attack", 20), 10)


best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
