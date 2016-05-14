#' Generates a data frame with Sequence, Schedule, NPV, Breakeven and 
#' Self Funding
#' @name mmf.df.1r
#' @param mmf.seq A list of sequences
#' @param mmf.sched A list of schedules
#' @param mmf.nvp A list of NPV values
#' @export
mmf.df.1r <- function(mmf.seq, mmf.sched, mmf.npv){
  
  all.seq <- list()
  for (seq in mmf.seq) {
    all.seq <- c(all.seq, toString(seq))
  }
  
  all.sched <- list()
  for (sched in mmf.sched) {
    all.sched <- c(all.sched, toString(sched))
  }
  
  df <- data.frame(sequence=unlist(all.seq), 
                   schedule=unlist(all.sched), 
                   npv=unlist(mmf.npv))
  
  return(df)
}