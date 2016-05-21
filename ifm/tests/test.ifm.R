library('RUnit')

# setwd("~/ifm/ifm/R")
#'setwd("C:/Users/IBM_ADMIN/nce_mestrado/economiaes/ifm/ifm/R")

source('present.value.R')
source('future.value.R')
source('net.present.value.R')
source('net.future.value.R')
source('mmf.all.sequences.R')
source('critical.path.method.R')
source('cpm.all.schedule.R')
source('discount.rate.vector.R')
source('draw.cfs.R') #'manual
test.draw.cfs_filenamedefault()
checkEquals(FALSE, "Arquivo default que deveria ser gravado não encontrado")
test.draw.cfs_passingfilename() 

source('draw.graph.R') #'manual
test.draw.cfs_filenamedefault() 
checkEquals(TRUE, "Arquivo com grafo criado de acordo com definição da função")




#'proximos
#' - present value seria o valor  e o npv a lista
#' - alterar o diretório para ser ...
#' - pensar na nomenclatura e corelacao entre funcoes (pensando diagrama de classes como estes métodos estariam)
#' - mmf.all.sequence


test.suite <- defineTestSuite("imf",
                              dirs = file.path("../tests"),
                              testFileRegexp = 'test.R')
test.result <- runTestSuite(test.suite)
printTextProtocol(test.result, showDetails = TRUE)
printHTMLProtocol(test.result, fileName = "RUnit-unit-test-log.html")
