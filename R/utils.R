#' Transform activities.successors to activities.predecessors.
#'
#' @name utils.suc2pred
#'
#' @param activities.successors The vector that contain all activities successors.
#'
#' @return activities.predecessors.
#'
#' @export utils.suc2pred
#'
#' @description This function convert activities.successors to
#' activities.predecessors.
#'
#' @keywords successors predecessors activities
#'
#' @family utility
#'
#' @examples
#'
#' ex.sheet.data <- excel.xls.to.list("../ifm/demo/resources/spreadsheet.xls")
#' act.pred <- utils.suc2pred(ex.sheet.data$predecessors)
#'
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

#' Transform activities.predecessors to activities.successors.
#'
#' @name utils.pred2suc
#'
#' @param activities.predecessors The vector that contain all activities predecessors.
#'
#' @return activities.successors.
#'
#' @export utils.pred2suc
#'
#' @description This function convert activities.predecessors to
#' activities.successors.
#'
#' @keywords successors predecessors activities
#'
#' @family utility
#'
#' @examples
#'
#' ex.sheet.data <- excel.xls.to.list("../ifm/demo/resources/spreadsheet.xls")
#' act.suc <- utils.pred2suc(ex.sheet.data$predecessors)
#'
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

#' Plot activities.predecessors to graph.
#'
#' @name utils.pred2graph
#'
#' @param activities.predecessors The vector that contain all activities predecessors.
#'
#' @return Edges to plot a graph..
#'
#' @export utils.pred2graph
#'
#' @description This function plot activities.predecessors to graph.
#'
#' @keywords successors predecessors activities graph
#'
#' @family utility
#'
#' @import igraph
#'
#' @examples
#'
#' ex.sheet.data <- excel.xls.to.list("../ifm/demo/resources/spreadsheet.xls")
#' g <- utils.pred2graph(ex.sheet.data$predecessors)
#' plot(g)
#'
utils.pred2graph <- function(activities.predecessors) {
  edges <- c()
  activity.index <- 1
  for (predecessors in activities.predecessors) {
    for (item in predecessors) {
      if(strtoi(item) != 0){
        edges <- c(edges, strtoi(item), activity.index);
      }
    }
    activity.index <- activity.index + 1;
  }
  return(edges)
}
