#' Return Max NPV
#' @name mmf.max.npv
#' @param mmf.npv.sum
#' @param mmf.seq
#' @param mmf.sched
#' @export
mmf.max.npv <- function(mmf.npv.sum, mmf.seq, mmf.sched) {
  npv.max <- which.max(mmf.npv.sum) # Identify position of MAX NPV
  npv.max.value <- mmf.npv.sum[[npv.max]] # Get value of MAX NPV
  npv.max.sequence <- mmf.seq[npv.max] # Get sequence with max NPV
  npv.max.sched <- mmf.sched[npv.max] # Get schedule with max NPV
  
  return(list(npv.max,
              npv.max.sequence, 
              npv.max.sched,
              npv.max.value))
}