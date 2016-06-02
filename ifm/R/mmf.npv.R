#' Calculates NPV for all schedules
#'
#' @name mmf.npv
#'  
#' @aliases mmf_npv 
#'  
#' @param cfs A vector with a series of cash flows.
#' @param durations A vector with a list of activities durations.
#' @param all.sequences List of all possible MMF sequences.
#' @param interest.rate A number that represents the nominal Interest Rate, 
#' presented by year.
#' @param begin.of.period A boolean that represents if the Tax Rate will be 
#' applied at the begining of period. FALSE by default, represents that Tax Rate
#' will be applied at second period .
#' 
#' @return A list with all shedules, all npv csf and sum of each npv.
#'  
#' @export mmf.npv
#'  
#' @keywords minimum marketable features, scheduling, project activities
#'  
#' @family scheduling
#'  
#' @examples
#'
#' # Loading data from XLS
#' ex.sheet.data <- excel.xls.to.list("../resources/spreadsheet.xls")
#' ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
#' ex.sheet.data.activities <- ex.sheet.data[[2]]
#' ex.sheet.data.durations <- ex.sheet.data[[3]]
#' ex.sheet.data.predecessors <- ex.sheet.data[[4]]
#' ex.sheet.data.cfs <- ex.sheet.data[[5]]
#'
#' # Generating all possible implementation sequences
#' ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)
#'
#' # Calculating NVP to all possible sequences
#' ex.mmf.npv <- mmf.max.npv(ex.sheet.data.cfs,
#'                           ex.sheet.data.durations,
#'                           ex.mmf.seq,
#'                           ex.sheet.data.interest.rate)
#'
#' # Selecting sequence ID which max NPV
#' ex.mmf.npv.max <- which.max(ex.mmf.npv[[3]])
#'
#' ex.mmf.sched <- ex.mmf.npv[[1]]
#' ex.mmf.npv <- ex.mmf.npv[[2]] 
#' ex.mmf.npv.sum <- ex.mmf.npv[[3]]
#'
#' # Index of sequence with max NPV
#' # ex.mmf.npv.max <- which.max(ex.mmf.npv.sum)
#' 
#' # Value of max NPV
#' ex.mmf.npv.max.value <- ex.mmf.npv.sum[[ex.mmf.npv.max]]
#' 
#' # Sequence with best NPV
#' ex.mmf.npv.max.sequence <- ex.mmf.seq[ex.mmf.npv.max]
#' 
#' # Schedule of sequence with best NPV
#' ex.mmf.npv.max.sched <- ex.mmf.sched[ex.mmf.npv.max]
#'

mmf.npv <- mmf_npv <- 
  function(cfs, durations, all.sequences, interest.rate, begin.of.period = FALSE) {
    
  all.schedules <- schedules.1r(all.sequences, durations)
  
  all.cfs.nominal <- list()
  all.cfs.discounted <- list()
  all.npv <- list()
  
  for (count in 1:length(all.schedules)) {
    last.start <- tail(all.schedules[[count]],1)
    current.schedule.cfs <- list()
    current.schedule.npv <- 0
    
    for (activity in 1:length(all.sequences[[count]])) {
      current.activity.id <- all.sequences[[count]][[activity]]
      current.activity.start <- all.schedules[[count]][[activity]]
      
      current.unlist.cfs <- unlist(cfs[current.activity.id,], use.names=FALSE)
      
      if(current.activity.start != 0) {
        current.activity.cfs <- (c(rep.int(0, current.activity.start - 1), 
                                   current.unlist.cfs[1:(length(current.unlist.cfs) - (current.activity.start - 1))]))
      } else {
        current.activity.cfs <- c(current.unlist.cfs[1:(length(current.unlist.cfs) - (current.activity.start - 1))])
      }
      
      current.schedule.cfs[[activity]] <- current.activity.cfs
      
      current.activity.npv <- net.present.value(current.activity.cfs, interest.rate, begin.of.period)
      current.schedule.npv <- current.schedule.npv + current.activity.npv
    }
    all.cfs.nominal[[count]] <- colSums(matrix(unlist(current.schedule.cfs),
                                               ncol = length(current.schedule.cfs[[1]]),
                                               byrow = T))
    all.cfs.discounted[[count]] <- discounted.csf(all.cfs.nominal[[count]],
                                                  interest.rate,
                                                  begin.of.period)
    all.npv[[count]] <- current.schedule.npv
    
  }
  return(list(schedules=all.schedules, 
              cfs.nominal=all.cfs.nominal, 
              cfs.discounted=all.cfs.discounted, 
              npv=all.npv))
  }