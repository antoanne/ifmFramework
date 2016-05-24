ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")

# vector with the edges
edges <- c()

# counter with activity index
activity.index <- 1

for (predecessors in ex.sheet.data$predecessors) {

  for (item in predecessors) {
    if(strtoi(item) != 0){
      edges <- c(edges, strtoi(item), activity.index);
    }
  }
  
  activity.index <- activity.index + 1;  
}

require("igraph")
require("XLConnect")
ex.graph.image.path <- draw.graph(edges)

print(ex.graph.image.path)