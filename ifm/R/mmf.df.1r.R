#' Generates a data frame with Sequence, Schedule, NPV, Breakeven and 
#' Self Funding
#' @name mmf.df.1r
#' @param mmf.seq A list of sequences
#' @param mmf.sched A list of schedules
#' @param mmf.nvp A list of NPV values
#' @export
#' @examples 
#' 
#' ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")
#' ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
#' ex.sheet.data.activities <- ex.sheet.data[[2]]
#' ex.sheet.data.durations <- ex.sheet.data[[3]]
#' ex.sheet.data.predecessors <- ex.sheet.data[[4]]
#' ex.sheet.data.cfs <- ex.sheet.data[[5]]
#' 
#' ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)
#' 
#' ex.mmf <- mmf.npv(ex.sheet.data.cfs,
#'                   ex.sheet.data.durations,
#'                   ex.mmf.seq,
#'                   ex.sheet.data.interest.rate)
#' 
#' ex.mmf.shedules <- ex.mmf[['shedules']]
#' ex.mmf.npv <- ex.mmf[['npv']]
#' 
#' ex.mmf.df.1r <- mmf.df.1r(ex.mmf.seq,
#'                           ex.mmf.schedules,
#'                           ex.mmf.npv,
#'                           ex.mmf.npv.selffunding,
#'                           ex.mmf.npv.breakeven)
#'                           
mmf.df.1r <- function(mmf.seq, mmf.sched, mmf.npv, npv.selffunding, npv.breakeven){
  
  all.seq <- list()
  for (seq in mmf.seq) {
    all.seq <- c(all.seq, toString(seq))
  }
  
  all.sched <- list()
  for (sched in mmf.sched) {
    all.sched <- c(all.sched, toString(sched))
  }
  
  all.selffunding <- list()
  for (selffunding in npv.selffunding) {
    all.selffunding <- c(all.selffunding, toString(selffunding))
  }
  
  all.breakeven <- list()
  for (breakeven in npv.breakeven) {
    all.breakeven <- c(all.breakeven, toString(breakeven))
  }
  
  df <- data.frame(sequence=unlist(all.seq), 
                   schedule=unlist(all.sched), 
                   npv=unlist(mmf.npv),
                   selffunding=unlist(all.selffunding),
                   breakeven=unlist(all.breakeven))
  
  return(df)
}