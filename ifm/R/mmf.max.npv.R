#' Return Max NPV
#' @name mmf.max.npv
#' @aliases 
#' @param mmf.npv.sum Vector of Net Present Value
#' @param mmf.seq Vector with the sequence of activities
#' @param mmf.sched Vector with the collection of possible schedules
#' @description this function identifies the sequence of activities and respectivies schedules where with the optimized NPV 
#' @return list with NPV, sequence and scheduleof the sequence with the maximum NPV 
#' @keywords
#' @family
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