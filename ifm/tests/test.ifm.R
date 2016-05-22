library('RUnit')

# setwd("~/ifm/ifm/R")
#'setwd("C:/Users/IBM_ADMIN/nce_mestrado/economiaes/ifm/ifm/R")
setwd("../../ifm/R")

source('net.present.value.R')
source('net.future.value.R')
source('mmf.all.sequences.R')
source('cpm.R')
source('cpm.all.schedule.R')
source('discount.rate.vector.R')
source('draw.cfs.R') #'manual
#test.draw.cfs_filenamedefault()
#checkEquals(FALSE, "Arquivo default que deveria ser gravado n?o encontrado")
#test.draw.cfs_passingfilename()

source('draw.graph.R') #'manual
#test.draw.graph_filenamedefault()
#checkEquals(TRUE, "Arquivo com grafo criado de acordo com defini??o da fun??o")

#'proximos
#' - present value seria o valor  e o npv a lista
#' - alterar o diret?rio para ser ...
#' - pensar na nomenclatura e corelacao entre funcoes (pensando diagrama de classes como estes m?todos estariam)
#' - mmf.all.sequence

setwd("../tests")

test.suite <- defineTestSuite("imf",
                              dirs = file.path("./"),
                              testFileRegexp = 'test.R')
test.result <- runTestSuite(test.suite)
printTextProtocol(test.result, showDetails = TRUE)
printHTMLProtocol(test.result, fileName = "RUnit-unit-test-log.html")