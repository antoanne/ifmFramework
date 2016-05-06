#' Calculates NPV for all schedules
#'
#' @name mmf.max.npv
#'  
#' @aliases mmf_max_npv 
#'  
#' @param cfs A vector with a series of cash flows.
#' @param durations A vector with a list of activities durations.
#' @param all.sequences List of all possible MMF sequences.
#' @param interest.rate A number that represents the nominal Interest Rate, 
#' presented by year.
#'  
#' @return One sequence with max NPV and its value
#'  
#' @export mmf.max.npv
#'  
#' @keywords minimum marketable features, scheduling, project activities
#'  
#' @family scheduling
#'  
#' @examples
#'  
#' ex.sheet.data <- excel.xls.to.list("../resources/spreadsheet.xls")
#' ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
#' ex.sheet.data.activities <- ex.sheet.data[[2]]
#' ex.sheet.data.durations <- ex.sheet.data[[3]]
#' ex.sheet.data.predecessors <- ex.sheet.data[[4]]
#' ex.sheet.data.cfs <- ex.sheet.data[[5]]
#'  
#' ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)
#'  
#' ex.mmf.npv <- mmf.max.npv(ex.sheet.data.cfs,
#'                           ex.sheet.data.durations,
#'                           ex.mmf.seq,
#'                           ex.sheet.data.interest.rate)
#'  
#' ex.mmf.npv.max <- which.max(ex.mmf.npv)
#'
#'
mmf.max.npv <- mmf_max_npv <- 
  function(cfs, durations, all.sequences, interest.rate) {
  all.shedules <- list()
  for (seq in all.sequences) {
    total.time <- 0
    current.schedule <- c()
    for (t in durations[seq]) {
      total.time <- total.time + t
      current.schedule <- c(current.schedule, c(total.time))
    }
    all.shedules <- c(all.shedules, list(current.schedule))
  }
  
  all.npv <- list()
  
  for (count in 1:length(all.shedules)) {
    last.start <- tail(all.shedules[[count]],1)
    current.schedule.npv.sum <- 0
    for (activity in 1:length(all.sequences[[count]])) {
      current.activity.id <- all.sequences[[count]][[activity]]
      current.activity.start <- all.shedules[[count]][[activity]]
      #print(c("current.activity.id: ", current.activity.id ))
      current.activity.cfs <- unlist(cfs[current.activity.id,], use.names=FALSE)
      
      current.activity.cfs <- (c(rep.int(0, current.activity.start - 1), 
              current.activity.cfs[1:(length(current.activity.cfs) - (current.activity.start - 1))]))
      #print(c("current.activity.start: ", current.activity.start))
      #print(c("current.activity.cfs: ", current.activity.cfs ))
      current.activity.npv <- net.present.value(current.activity.cfs, interest.rate)
      current.activity.npv.sum <- sum(current.activity.npv)
      
      current.schedule.npv.sum <- current.schedule.npv.sum + current.activity.npv.sum
      #print(c("current.activity.npv.sum: ", current.activity.npv.sum))
      #print("_________")
    }
    all.npv[count] <- current.schedule.npv.sum
    
  }
  
  return(all.npv)
}

# TEST
#ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")
#ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
#ex.sheet.data.activities <- ex.sheet.data[[2]]
#ex.sheet.data.durations <- ex.sheet.data[[3]]
#ex.sheet.data.predecessors <- ex.sheet.data[[4]]
#ex.sheet.data.cfs <- ex.sheet.data[[5]]
  
#ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)

#ex.mmf.npv <- mmf.max.npv(ex.sheet.data.cfs,
#                          ex.sheet.data.durations,
#                          ex.mmf.seq,
#                          ex.sheet.data.interest.rate)

#ex.mmf.npv.max <- which.max(ex.mmf.npv)
#ex.mmf.npv.max.sequence <- ex.mmf.seq[ex.mmf.npv.max]