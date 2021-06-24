#' Export the generated ifm package results to a spreadsheet.
#'
#' @name excel.list.to.xls
#'
#' @aliases excel_list_to_xls excelListToXls
#'
#' @param list.ifm.result The list with all results proccessed by the IFM
#' package.
#'
#' @return file.path The path to the generated file.
#'
#' @export excel.list.to.xls
#'
#' @description This function is responsible for reading a list of objects and
#' export a spreadsheet with the results proccessed by the IFM package.
#' The file contains:
#' \itemize{
#'  \item The raw data frame used to calculate the maxNPV, minSF and minBKE;
#'  \item The image oh the generated graph;
#'  \item The image oh the "Discounted Cash x Time" chart;
#'  \item The image oh the "MPV (ca$h) x Schedulling ID" chart;
#'  \item The image oh the "Self Funding (time) x Schedulling ID" chart;
#'  \item The image oh the "Breaking Event (time) x Schedulling ID" chart;
#' }
#'
#' @keywords excel maxNPV list.to.xls
#'
#' @family utility
#'
#' @import XLConnect
#'
#' @examples
#'
#' data("ex.sheet.data")
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
#' ex.mmf.schedules <- ex.mmf[['schedules']]
#' ex.mmf.cfs.nominal <- ex.mmf[['cfs.nominal']]
#' ex.mmf.cfs.discounted <- ex.mmf[['cfs.discounted']]
#' ex.mmf.npv <- ex.mmf[['npv']]
#'
#' ex.mmf.npv.selffunding <- mmf.get.selffunding(ex.mmf.cfs.discounted)
#' ex.mmf.npv.breakeven <- mmf.get.breakeven(ex.mmf.cfs.discounted)
#'
#' ex.mmf.df.1r <- mmf.df.1r(ex.mmf.seq,
#'                           ex.mmf.schedules,
#'                           ex.mmf.npv,
#'                           ex.mmf.npv.selffunding,
#'                           ex.mmf.npv.breakeven)
#'
#' ex.file.path <- excel.list.to.xls(ex.mmf.df.1r)
#'
#
# require("XLConnect")

excel.list.to.xls <- excel_list_to_xls <- excelListToXls<-
  function(list.ifm.result){

    # generate a formatted date-time to append on the file path
    date.time <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S")

    # define a file path to save the spreadsheet
    file.path <- paste("../ifm/demo/output/ifm-result-", date.time, ".xls", sep = "")

    print(file.path)

    # get the data frame of the list
    data.frame <- list.ifm.result$sequence

    # get the vector that contains the images paths
    image.path.vector <- list.ifm.result$schedule

    #creating an Excel workbook.
    workbook <- loadWorkbook(file.path, create = TRUE)

    #creating all the necessary sheets within an Excel workbook

    # data frame sheet
    createSheet(workbook, name = "ifm-results")
    # graph sheet
    createSheet(workbook, name = "ifmGraph")
    # max npv chart sheet
    createSheet(workbook, name = "ifmMaxnpv")
    # discounted cash chart sheet
    createSheet(workbook, name = "ifmDiscountedCash")
    # min self funding chart sheet
    createSheet(workbook, name = "ifmSelfFunding")
    # min breaking even chart sheet
    createSheet(workbook, name = "ifmBreakingEven")

    # writing the data.frame into ifm-results sheet
    writeWorksheet(workbook, data.frame, sheet = "ifm-results", startRow = 2,
                   startCol = 2)

    # ------------------ graph image ------------------------------------------#
    # writing the graph-image into ifm-graph sheet
    # Create a named region called 'ifmGraph' referring to the sheet 'ifmGraph'
    createName(workbook, name = "ifmGraph", formula = "ifmGraph!$B$2")

    # Write image to the named region created above
      # addImage(workbook, filename = image.path.vector[1], name = "ifmGraph",
      #          originalSize = TRUE)
    # -------------------------------------------------------------------------#

    # ------------------- maxNPV image ----------------------------------------#
    # writing the maxNPV-image into ifmMaxnpv sheet
    # Create a named region called 'ifmMaxnpv' referring the sheet 'ifmMaxnpv'
    createName(workbook, name = "ifmMaxnpv", formula = "ifmMaxnpv!$B$2")

    # Write image to the named region created above
      # addImage(workbook, filename = image.path.vector[2], name = "ifmMaxnpv",
      #          originalSize = TRUE)
    # -------------------------------------------------------------------------#

    # ------------------- discounted cash image -------------------------------#
    # writing the discounted-cash-image into ifmDiscountedCash sheet
    # Create a named region called 'ifmDiscountedCash'
    # referring to the 'ifmDiscountedCash'
    createName(workbook, name = "ifmDiscountedCash",
               formula = "ifmDiscountedCash!$B$2")

    # Write image to the named region created above
      # addImage(workbook, filename = image.path.vector[3],
      #          name = "ifmDiscountedCash",
      #          originalSize = TRUE)
    # -------------------------------------------------------------------------#

    # ------------------- self funding image ----------------------------------#
    # writing the self-funding-image into ifmSelfFunding sheet
    # Create a named region called 'ifmSelfFunding'
    # referring to the 'ifmSelfFunding'
    createName(workbook, name = "ifmSelfFunding",
               formula = "ifmSelfFunding!$B$2")

    # Write image to the named region created above
      # addImage(workbook, filename = image.path.vector[4], name = "ifmSelfFunding",
      #          originalSize = TRUE)
    # -------------------------------------------------------------------------#

    # ------------------- breaking even image ---------------------------------#
    # writing the breaking-even-image into ifmBreakingEven sheet
    # Create a named region called 'ifmBreakingEven'
    # referring to the 'ifmBreakingEven'
    createName(workbook, name = "ifmBreakingEven",
               formula = "ifmBreakingEven!$B$2")

    # Write image to the named region created above
      # addImage(workbook, filename = image.path.vector[5],
      #          name = "ifmBreakingEven",
      #          originalSize = TRUE)
    # -------------------------------------------------------------------------#

    #saving a workbook to an Excel file :
    saveWorkbook(workbook)

    return (file.path)
  }
