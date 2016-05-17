#' Extract a list of variables from the spreadsheet to be used on the maxNPV
#'  function.
#' 
#' @name excel.xls.to.list
#' 
#' @aliases excel_xls_to_list excelXlsToList
#' 
#' @param xls.spreadsheet.path The complete path to the spreadsheet that
#' represents the project.
#' 
#' @return List of variables to be used on the maxNPV function.
#' 
#' @export excel.xls.to.list
#' 
#' @description This function is responsible for reading a spreadsheet 
#' representing the project, and return a list with the following information
#' (in this order): The interest rate, the list of activities, the list of 
#' durations of activities, the list of predecessors of activities and the 
#' matrix that represents the cash flow series
#' 
#' @keywords excel maxNPV xls.to.list
#' 
#' @family utility
#' 
#' @import XLConnect
#' 
#' @examples
#'
#' ex.sheet.data <- excel.xls.to.list("../resources/spreadsheet.xls")
#' 

require("XLConnect")

excel.xls.to.list <- excel_xls_to_list <- excelXlsToList <-
  function(xls.spreadsheet.path){
    
    # load the workbook
    workbook <- loadWorkbook(xls.spreadsheet.path, create = FALSE)
    
    # data frame that represents the cash flow series matrix
    data.frame.cash.flow.series <- readNamedRegion(workbook, name = "cfs", 
                                                   header = FALSE)
    
    # data frame that represents the vector of predecessors
    #data.frame.
    predecessors.from.xls <- readNamedRegion(workbook, name = "predecessor", 
                                               header = FALSE)
    data.frame.predecessors <- list()
    count <- 1
    # validate the numbers of 0 (starts) in the predecessors vector
    number.of.starts <- 0
    for (current.predecessors in predecessors.from.xls[,1]) {
      current.predecessors.list <- c()
      for (item in strsplit(current.predecessors, ",")) {
        current.predecessors.list <- c(current.predecessors.list, strtoi(item))
        if(is.element(0,strtoi(item)) == TRUE) {
          number.of.starts <- number.of.starts + 1
        }
      }
      data.frame.predecessors[[count]] <- current.predecessors.list
      count <- count + 1
    }
    
    if(number.of.starts > 1){
      print("ERROR IN GRAPH VALIDATION, THERE ARE MORE THEN ONE START")
      stop("ERROR IN GRAPH VALIDATION, THERE ARE MORE THEN ONE START")
    }
    
    # data frame that represents the vector of durations
    data.frame.durations <- readNamedRegion(workbook, name = "duration", 
                                            header = FALSE)
    
    # data frame that represents the vector of activities
    data.frame.activities <- readNamedRegion(workbook, name = "activities", 
                                             header = FALSE)
    
    # data frame that represents the interest rate
    data.frame.interest.rate <- (readNamedRegion(workbook, 
                                                name = "interestrate",
                                                header = FALSE) *100)

    # list of variables to be used in maxNPV
    variables.list <- list(data.frame.interest.rate[[1]], 
                           data.frame.activities[[1]], 
                           data.frame.durations[[1]],
                           data.frame.predecessors, 
                           data.frame.cash.flow.series)
    
    return (variables.list)
  }