#ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")

# predecessors.foo <- ex.sheet.data$predecessors
# 
# #print(predecessors.foo)
# 
# lista.foo <- list()
# 
# for(predecessor in predecessors.foo){
#   for(item in predecessor){
#     
#     lista.foo <- 
#     
#     print(paste("Predecessor :: ", item));
#   }
# }
# 



# require("igraph")
#ex.graph.image.path <- draw.graph(c(1,2, 1,3, 2,3, 3,4))
#ex.graph.image.path <- draw.graph(c(1,2, 1,5, 2,3, 3,4, 4,7, 5,6, 6,7))

# vector with the edges
edges <- c()

# counter with activity index
activity.index <- 1

for (predecessors in ex.sheet.data$predecessors) {
  #print(activity.index)
  
  if(length(predecessors) == 1 && predecessors != 0){
    #print(paste(" tem um soh :: ", strtoi(predecessors)))
    # add on the vector the activity index and the predecessor
    edges[[activity.index - 1]] <- c(strtoi(predecessors), activity.index)
  } else if(length(predecessors) > 1){
    temp.counter <- activity.index - 1;
    #print(" tem mais de um ")
    for (item in predecessors) {
      #print(activity.index)
      #print(paste("fff :: " , item))
      edges[[temp.counter]] <- c(strtoi(item), activity.index);
      temp.counter <- temp.counter + 1;
    }
  }

  activity.index <- activity.index + 1;  
}

vetor.final <- c()
indice <- 1;
for (no in edges) {
  vetor.final[[indice]] <- no[[1]]
  indice <- indice + 1;
  vetor.final[[indice]] <- no[[2]]
  indice <- indice + 1;
}

print(vetor.final)

require("igraph")
ex.graph.image.path <- draw.graph(vetor.final)