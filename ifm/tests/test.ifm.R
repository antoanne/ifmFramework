library('RUnit')

# setwd("~/mestrado/ifm/ifm/R")
setwd("C:/Users/IBM_ADMIN/nce_mestrado/economiaes/ifm/ifm/R")

source('present.value.R')
source('future.value.R')
source('net.present.value.R')
source('net.future.value.R')
source('mmf.all.sequences.R')
source('critical.path.method.R')
source('cpm.all.schedule.R')


test.suite <- defineTestSuite("imf",
                              dirs = file.path("../tests"),
                              testFileRegexp = 'test.R')

test.result <- runTestSuite(test.suite)

#'printTextProtocol(test.result)
printTextProtocol(test.result, showDetails = TRUE)
printHTMLProtocol(test.result, fileName = "RUnit-unit-test-log.html")
