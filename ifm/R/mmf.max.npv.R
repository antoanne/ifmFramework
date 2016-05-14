#' Return Max NPV
#' @name mmf.max.npv
#' 
mmf.max.npv <- function(mmf.npv.sum, mmf.seq, mmf.sched) {
  npv.max <- which.max(mmf.npv.sum) # Identify position of MAX NPV
  npv.max.value <- mmf.npv.sum[[npv.max]] # Get value of MAX NPV
  npv.max.sequence <- mmf.seq[ex.mmf.npv.max] # Get sequence with max NPV
  npv.max.sched <- mmf.sched[ex.mmf.npv.max] # Get schedule with max NPV
  
  return(list(npv.max.sequence, 
              npv.max.sched,
              npv.max.value))
}