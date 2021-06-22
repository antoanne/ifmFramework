#' Generates all schedules for ONE resource, Denne Method.
#' @name schedules.1r
#' @param sequences All sequences
#' @param durations Duration of activities
#' @export
schedules.1r <- function(sequences, durations) {
  schedules <- list()
  for (seq in sequences) {
    total.time <- 0
    current.schedule <- c()
    for (t in durations[seq]) {
      current.schedule <- c(current.schedule, c(total.time))
      total.time <- total.time + t
    }
    schedules <- c(schedules, list(current.schedule))
  }
  return(schedules)
}