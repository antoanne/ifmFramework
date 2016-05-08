library('RUnit')

setwd("~/mestrado/ifm/ifm/R")

source('present.value.R')
source('future.value.R')
source('net.present.value.R')
source('net.future.value.R')


test.suite <- defineTestSuite("imf",
                              dirs = file.path("../tests"),
                              testFileRegexp = 'test.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)

