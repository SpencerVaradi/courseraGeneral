
simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}
outcome <- "heart attack"
state <- "PA"
library(dplyr)

best <- function (state,outcome) {
# hospitals_origin <- read.csv("hospital-data.csv", header = TRUE, stringsAsFactors = FALSE)
outcomes_origin <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
# hospitals <- hospitals_origin
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
  return (bestList$Hospital.Name[1])
  }
  }
}
best("TA", "heart attack")
best("NY", "hert attack")
