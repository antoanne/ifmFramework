#' Get a list with all Breakeven points from CFS
#' @name mmf.get.breakeven
#' @param mmf.cfs A list with a vector with a series of cash flows for each MMF
#' sechedule.
#' @return A list with all Breakeven points for each MMF
#' @export
#' @keywords minimum marketable features, scheduling, breakeven
#' @family scheduling
#' @examples
#'
#' ex.sheet.data <- excel.xls.to.list("../ifm/demo/resources/spreadsheet.xls")
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
#' ex.mmf.npv.selffunding <- mmf.get.breakeven(ex.mmf[['cfs.discounted']])
#'
mmf.get.breakeven <- function(mmf.cfs) {
  all.breakeven <- list()
  for (count in 1:length(mmf.cfs)) {
    current.cfs <- cumsum(unlist(mmf.cfs[[count]]))
    current.cfs[which(current.cfs < 0)] = 0
    all.breakeven[[count]] <- min(which(current.cfs > 0))
  }
  return(all.breakeven)
}
