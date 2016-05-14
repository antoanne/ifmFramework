#' Generates all possible schedules for a cpm network
#' 
#' @name cpm.all.schedule
#' 
#' @aliases cpm_all_schedule genAllCpmSched 
#' 
#' @param est early start time vector
#' @param slack activities slack
#' 
#' @description Generates all possible schedules for a cpm network
#' 
#' @export
#' 
#' @return Matrix with all mininum makespan (the time to complete all jobs) cpm start time schedules
#' 
#' @keywords critical path, scheduling, project activities
#' 
#' @family scheduling
#' 
#' @examples
#' #Use critical.path.method function to calculate a set of project 
#' #activities:
#' 
#' ex.cpm.activities.duration <- c(1,4,5,7,2,3,1)
#' ex.cpm.activities.successors <- list(c(2,3), 4, c(4,5), 6, 7, 7, c(0))
#' ex.cpm <- critical.path.method(ex.cpm.activities.duration, 
#'                                ex.cpm.activities.successors)
#'
#' # Now, that we have the CPM vector with:
#' #  - est (Early Start Time) - ex.cpm[[1]]
#' #  - eft (Early Finish Time) - ex.cpm[[2]]
#' #  - lst (Late Start Time) - ex.cpm[[3]]
#' #  - lft (Late Finish Time) ex.cpm[[4]]
#'
#' ex.cpm.activities.schedule <- cpm.all.schedule(ex.cpm[[1]], 
#'                                                ex.cpm[[3]] - ex.cpm[[1]])
#'                                                
#' # note: ex.cpm[[3]] - ex.cpm[[1]] is the slack time (or 'float') for each task
#' 
cpm.all.schedule <- cpm_all_schedule <- genAllCpmSched <- function(est, slack){
  # Constants
  slack <- slack + 1
  m <- prod(slack)
  n <- length(slack)
  
  # Variables
  current.schedule <- vector(mode = "numeric", length = n)
  schedule.matrix <- matrix(ncol = n, nrow = m)
  
  #Algorithm
  schedule.matrix[1,] <- current.schedule + est
  k <- 2 #row index for current.schedule
  
  for (j in 1:m){
    carry <- 1
    for (i in n:1){
      v <- current.schedule[i] + carry            
      if (v >= slack[i]){
        current.schedule[i] <- 0
        carry <- 1                
      } else {                
        current.schedule[i] <- v  
        carry <- 0                
        sched <- current.schedule + est                
        schedule.matrix[k,] <- sched
        k <- k+1    
        break
      }
    }
  }
  return(schedule.matrix)
}