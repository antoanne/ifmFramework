#' Draw the graph imported from the spreadsheet.
#' 
#' @name draw.graph
#' 
#' @aliases draw_graph drawGraph
#' 
#' @param edges - A vector defining the edges, the first edge points from the 
#' first element to the second, the second edge from the third to the fourth, 
#' etc.
#' 
#' @return graph.image.path - The path to the generated graph file.
#' 
#' @export draw.graph
#' 
#' @description This function is responsible for ploting the graph based on the 
#' edges and export the image to a file.
#' 
#' @keywords draw graph drawGraph
#' 
#' @family draw
#' 
#' @import igraph
#' 
#' @examples
#' 
#' ex.graph.image.path <- draw.graph(c(1,2, 1,3, 2,3, 3,4))
#' 
require("igraph")

draw.graph <- draw_graph <- drawGraph <-
  # initialize a vector if null
  function(edges = c(1,2, 1,3, 2,3)){
    
    # generate a formatted date-time to append on the file path
    date.time <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S")
    
    # define a file path to save the spreadsheet
    file.path <- paste("output/graph-", date.time, ".png", sep = "")
    
    # generate the image file to be saved
    png(file.path)
    
    # make the graph to be plotted
    generated.graph <- make_graph(edges, directed = TRUE )
    
    # plot the graph using some customizations
    plotted.graph <- plot(generated.graph,
         layout=layout_nicely,
         vertex.size=30,
         vertex.label.color="white",
         vertex.color="blue",
         edge.arrow.size=0.5)
    
    # turn off the dev mode
    dev.off()
    
    return (file.path)
  }