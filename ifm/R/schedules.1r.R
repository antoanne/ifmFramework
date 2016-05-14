#' Generates all schedules for ONE resource, Denne Method.
#' @name schedules.1r
#' @param sequences All sequences
#' @param durations Duration of activities
schedules.1r <- function(sequences, durations) {
  schedules <- list()
  for (seq in sequences) {
    total.time <- 0
    current.schedule <- c()
    for (t in durations[seq]) {
      total.time <- total.time + t
      current.schedule <- c(current.schedule, c(total.time))
    }
    schedules <- c(schedules, list(current.schedule))
  }
  return(schedules)
}