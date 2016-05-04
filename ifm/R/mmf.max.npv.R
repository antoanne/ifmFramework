#'  Calculates NPV for all schedules
#'
#'  @name mmf.max.npv
#'  
#'  @aliases mmf_max_npv
#'  
#'  @return One sequence with max NPV and its value
#'  
#'  @export mmf.max.npv
#'  
#'  @keywords minimum marketable features, scheduling, project activities
#'  
#'  @family scheduling
#'  
#'  @example
#'  
#'  ex.sheet.data <- excel.xls.to.list("../resources/spreadsheet.xls")
#'  ex.max.npv <- mmf.max.npv(c(-100, 80, 81, 82, 83, 84, 85, 86), 
#'              c(1, 4, 5, 7, 2, 3, 1),
#'              c(1,2,3,4,5,6,7),
#'              0.024)
#'
#'
mmf.max.npv <- mmf_max_npv <- function() {
  return(c(1,1,1,1))
}

ex.sheet.data <- excel.xls.to.list("../resources/spreadsheet.xls")