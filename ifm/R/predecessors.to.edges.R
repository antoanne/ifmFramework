#' Generate a vector with the edges to be plotted by draw.graph function.
#' 
#' @name predecessors.to.edges
#' 
#' @aliases predecessors_to_edges predecessorsToEdges
#' 
#' @param list.of.predecessors The vector that contain all activities predecessors.
#' 
#' @return edges - List of edges to be used on the draw.graph function.
#' 
#' @export predecessors.to.edges
#' 
#' @description This function is responsible for reading a vector with all 
#' activities predecessors and generate a list of the edges that will be 
#' plotted by the draw.graph function.
#' 
#' @keywords draw draw.graph
#' 
#' @family utility
#' 
#' @examples
#'
#' ex.edges <- predecessors.to.edges(ex.sheet.data$predecessors)
#' 
predecessors.to.edges <- predecessors_to_edges <- predecessorsToEdges <-
  
  # initialize a vector of predecessors if NULL
  function(list.of.predecessors = list()){

    # initialize a vector with the edges
    edges <- c()
    
    # counter with activity index
    activity.index <- 1
    
    # loop in the list.of.predecessors
    for (predecessors in list.of.predecessors) {
      
      # loop the predecessors if there are more then one activity predecessor
      for (item in predecessors) {
        # discard the item 0 (start of the graph)
        if(strtoi(item) != 0){
          # include the pair item and activity index
          edges <- c(edges, strtoi(item), activity.index);
        }
      }
      # increment the activity index    
      activity.index <- activity.index + 1;  
    }
    
    return (edges)  
  }