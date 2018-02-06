library(dplyr)
library(lazyeval)

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
      # outcomes_tmp <- outcomes_tmp[!is.na(outcomes_tmp[3]),]

      outcomes_tmp <- tbl_df(outcomes_tmp)
      bestList <- outcomes_tmp %>%
        select(Hospital.Name, State, UQ(outcome)) %>%
        #  mutate_(outcome = as.numeric(outcome)) %>%
        filter(State == state) %>%
        arrange_(outcome, "Hospital.Name") %>%
        as.data.frame()

      bestList <- bestList[!is.na(bestList[3]),]

      if (num == "worst") {
        num <- nrow(bestList)
      }
      if(num == "best"){
        num <- 1
      }
      if (num > nrow(bestList)) {
        return(NA)
      }
      return (bestList$Hospital.Name[num])
    }
  }
}
