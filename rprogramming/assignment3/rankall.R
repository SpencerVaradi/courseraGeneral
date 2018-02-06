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
