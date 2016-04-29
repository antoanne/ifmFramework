#' Scheduling a set of project activities
#' 
#' @name critical.path.method
#' 
#' @aliases critical_path_method cpm
#' 
#' @param activities.duration Vector with activities duration.
#' @param activities.successors Vector with dependencies between activities.
#' 
#' @export
#' 
#' @description The Critical Path Method or Critical Path Analysis, is a 
#' mathematically based algorithm for scheduling a set of project activities. 
#' 
#' CPM will get how long your complex project will take to complete and which 
#' activities are "critical," meaning that they have to be done on time or else 
#' the whole project will take longer.
#' 
#' CPM calculates: 
#' 
#' As input, CPM will receive: 
#' 
#'    - A list of all activities required to complete the project;
#'    
#'    - The time (duration) that each activity will take to completion;
#'    
#'    - The dependencies between the activities. 
#'    
#'    
#' And will return:
#' 
#'    - The optimized sequence of activities that must be performed to guarantee
#'    the shorthest duration.
#' 
#' @keywords critical path, scheduling, project activities
#' 
#' @family scheduling
#' 
#' @examples
#' ex.activities.duration <- c(1,4,5,7,2,3,1)
#' ex.activities.successors <- list(c(2,3), 4, c(4,5), 6, 7, 7, c(0))
#' ex.cpm <- critical.path.method(ex.activities.duration, 
#'                                ex.activities.successors)
#' 

critical.path.method <- critical_path_method <- cpm <- 
  function(activities.duration, activities.successors) {
  cpm.nodes <- c()
  
  for (i in 1:length(activities.successors)) {
    cpm.nodes <- c(cpm.nodes, 
                   cpm.node(duration=activities.duration[i], 
                   name=i, 
                   succcessors=activities.successors[i]))
  }
  
  # defines EFT to node #1
  slot(cpm.nodes[[1]], "eft") <- slot(cpm.nodes[[1]], "duration")
  
  # defines ES and EFT values for each node
  for (i in 1:length(cpm.nodes)-1) {
    for (s in activities.successors[i]) {
      for (n in s) {
        slot(cpm.nodes[[n]], "es") <- max(slot(cpm.nodes[[n]], "es"), 
                                          slot(cpm.nodes[[i]], "eft"))
        slot(cpm.nodes[[n]], "eft") <- (slot(cpm.nodes[[n]], "es") + 
                                        slot(cpm.nodes[[n]], "duration"))
      }
    }
  }
  
  # defines LFT e LST to node #1
  slot(cpm.nodes[[length(cpm.nodes)]], "lft") <- 
    slot(cpm.nodes[[length(cpm.nodes)]], "eft")
  
  slot(cpm.nodes[[length(cpm.nodes)]], "lst") <- 
    slot(cpm.nodes[[length(cpm.nodes)]], "eft") - 
    slot(cpm.nodes[[length(cpm.nodes)]], "duration")
  
  # defines (from back to front) LFT and LST values for each node
  for (i in (length(cpm.nodes)-1):1) {
    for (s in activities.successors[[i]]) {
      if(slot(cpm.nodes[[i]], "lft") == 0) {
        slot(cpm.nodes[[i]], "lft") <- slot(cpm.nodes[[s]], "lst")
      } else {
        slot(cpm.nodes[[i]], "lft") <- min(slot(cpm.nodes[[s]], "lst"), 
                                           slot(cpm.nodes[[i]], "lft"))
      }
    }
    slot(cpm.nodes[[i]], "lst") <- 
      slot(cpm.nodes[[i]], "lft") - slot(cpm.nodes[[i]], "duration")
  }
  return(cpm.nodes)
}