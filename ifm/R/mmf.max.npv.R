#' Return Max NPV
#' @name mmf.max.npv
#' @param mmf.npv Vector of Net Present Value
#' @param mmf.seq Vector with the sequence of activities
#' @param mmf.schedules Vector with the collection of possible schedules
#' @description this function identifies the sequence of activities and respectivies schedules where with the optimized NPV 
#' @return list with NPV, sequence and scheduleof the sequence with the maximum NPV 
#' @keywords npv
#' @family schedule
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
#' ex.mmf.cfs.nominal <- ex.mmf[['cfs.nominal']]
#' ex.mmf.cfs.discounted <- ex.mmf[['cfs.discounted']]
#' ex.mmf.npv <- ex.mmf[['npv']]
#' 
mmf.max.npv <- function(mmf.npv, mmf.seq, mmf.schedules) {
  npv.max <- which.max(mmf.npv) # Identify position of MAX NPV
  npv.max.value <- mmf.npv[[npv.max]] # Get value of MAX NPV
  npv.max.sequence <- mmf.seq[npv.max] # Get sequence with max NPV
  npv.max.schedules <- mmf.schedules[npv.max] # Get schedule with max NPV
  
  return(list(id = npv.max,
              sequence = npv.max.sequence, 
              schedule = npv.max.schedules,
              value = npv.max.value))
}