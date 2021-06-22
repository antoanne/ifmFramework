library(ifm)
library(igraph)
library(XLConnect)

ex.sheet.data <- excel.xls.to.list('demo/resources/spreadsheet.xls')
ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
ex.sheet.data.activities <- ex.sheet.data[[2]]
ex.sheet.data.durations <- ex.sheet.data[[3]]
ex.sheet.data.predecessors <- ex.sheet.data[[4]]
ex.sheet.data.cfs <- ex.sheet.data[[5]]

edges <- utils.pred2graph(ex.sheet.data.predecessors)
g <- make_graph(edges, directed = TRUE )
plot(g)

