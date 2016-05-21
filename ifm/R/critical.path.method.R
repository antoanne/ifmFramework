#' The critical path method (CPM) is a step-by-step project management technique for process 
#' planning that defines critical and non-critical tasks with the goal of preventing time-frame
#' problems and process bottlenecks#' activities are "critical," meaning that they have to be done on time or else 
#' the whole project will take longer.
#' 
#' @name critical.path.method
#' 
#' @aliases critical_path_method cpm
#' 
#' @param activities.duration Vector with activities duration.
#' @param activities.successors Vector with dependencies between activities.
#' 
#' @description The Critical Path Method or Critical Path Analysis, is a 
#' mathematically based algorithm for scheduling a set of project activities. 
#' 
#' CPM will get how long your complex project will take to complete and which 
#' activities are "critical," meaning that they have to be done on time or else 
#' the whole project will take longer.
#' @export
#' @return Returns list of EST (Early Start Time), EFT(Early Finish Time),LST(Lately Start Time), LFT (Lately Finish Time) using Forward Pass and Backward Pass 
#' 
#' @keywords critical path, scheduling, project activities
#' 
#' @family scheduling
#' 
#' @examples
#' ex.cpm.activities.duration <- c(1,4,5,7,2,3,1)
#' ex.cpm.activities.successors <- list(c(2,3), 4, c(4,5), 6, 7, 7, c(0))
#' ex.cpm <- critical.path.method(ex.cpm.activities.duration, 
#'                                ex.cpm.activities.successors)
#' 
critical.path.method <- critical_path_method <- cpm <- 
  function(activities.duration, activities.successors){
  
  #generates predecessors vector from sucessors
  activities.predecessors <- rep(list(0), length(activities.successors))
  current.position <- 1
  for (node in activities.successors) {
    #print(c(">>>", current.position))
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
  
  activities.quantity <- length(activities.duration)
  #generates early and late start times of for a cpm network
  est<-vector (mode="numeric", length=activities.quantity)
  eft<-vector (mode="numeric", length=activities.quantity)
  lst<-vector (mode="numeric", length=activities.quantity)
  lft<-vector (mode="numeric", length=activities.quantity)
  
  #Functions
  cpm.forward <- function(s=1){
    #find early start and finish times
    eft[s] <<- est[s] + activities.duration[s]    
    if (activities.successors[[s]][1]!=0){
      for (i in activities.successors[[s]]){
        if (est[i] < eft[s]){
          est[i]<<-eft[s]
        }   
        cpm.forward(i)
      }	
    }
    
  }
  
  cpm.backward<-function(s){
    #find late start and finish times
    lst[s]<<-lft[s] - activities.duration[s]      
    if (activities.predecessors[[s]][1]!=0){
      for (i in activities.predecessors[[s]]){
        if (lft[i]>lst[s]){
          lft[i]<<-lst[s]            
        }                  
        cpm.backward(i)
      }
    }
  }
  
  #Main
  cpm.forward()
  lft<-rep(eft[activities.quantity], times=activities.quantity)
  cpm.backward(activities.quantity)
  return(list(est,eft,lst,lft))
}

