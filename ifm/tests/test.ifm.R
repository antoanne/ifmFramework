library('RUnit')

# setwd("~/mestrado/ifm/ifm/R")
setwd("C:/Users/IBM_ADMIN/nce_mestrado/economiaes/ifm/ifm/R")

source('present.value.R')
source('future.value.R')
source('net.present.value.R')
source('net.future.value.R')
source('mmf.all.sequences.R')

test.suite <- defineTestSuite("imf",
                              dirs = file.path("../tests"),
                              testFileRegexp = 'test.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)

