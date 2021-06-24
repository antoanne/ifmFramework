library(XLConnect)
library(ifm)

ex.sheet.data <- excel.xls.to.list('data-raw/spreadsheet.xls')

usethis::use_data(ex.sheet.data, overwrite = TRUE)
