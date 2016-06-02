utils.suc2pred <- function(activities.successors) {
  #generates predecessors vector from sucessors
  activities.predecessors <- rep(list(0), length(activities.successors))
  current.position <- 1
  for (node in activities.successors) {
    for(n in node) {
      if(n != 0) {
        if(activities.predecessors[[n]][1] == 0) {
          activities.predecessors[[n]] <- c(current.position)
        } else {
          activities.predecessors[[n]] <- c(activities.predecessors[[n]], c(current.position))
        }
      }
    }
    current.position <- current.position + 1
  }
  return(activities.predecessors)
}

utils.pred2suc <- function(activities.predecessors) {
  #generates sucessors vector from predecessors
  activities.successors <- rep(list(0), length(activities.predecessors))
  current.position <- 1
  for (node in activities.predecessors) {
    for(n in node) {
      if(n != 0) {
        if(activities.successors[[n]][1] == 0) {
          activities.successors[[n]] <- c(current.position)
        } else {
          activities.successors[[n]] <- c(activities.successors[[n]], current.position)
        }
      }
    }
    current.position <- current.position + 1
  }
  return(activities.successors)
}