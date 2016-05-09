library('RUnit')

source('..\net.present.value.R')

test.suite <- defineTestSuite("example",
                              dirs = getwd(),
                              testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)