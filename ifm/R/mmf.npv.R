#' Calculates NPV for all schedules
#'
#' @name mmf.npv
#'  
#' @aliases mmf_npv 
#'  
#' @param cfs A vector with a series of cash flows.
#' @param durations A vector with a list of activities durations.
#' @param all.sequences List of all possible MMF sequences.
#' @param interest.rate A number that represents the nominal Interest Rate, 
#' presented by year.
#'  
#' @return A list with all shedules, all npv csf and sum of each npv.
#'  
#' @export mmf.npv
#'  
#' @keywords minimum marketable features, scheduling, project activities
#'  
#' @family scheduling
#'  
#' @examples
#'
#' # Loading data from XLS
#' ex.sheet.data <- excel.xls.to.list("../resources/spreadsheet.xls")
#' ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
#' ex.sheet.data.activities <- ex.sheet.data[[2]]
#' ex.sheet.data.durations <- ex.sheet.data[[3]]
#' ex.sheet.data.predecessors <- ex.sheet.data[[4]]
#' ex.sheet.data.cfs <- ex.sheet.data[[5]]
#'
#' # Generating all possible implementation sequences
#' ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)
#'
#' # Calculating NVP to all possible sequences
#' ex.mmf.npv <- mmf.max.npv(ex.sheet.data.cfs,
#'                           ex.sheet.data.durations,
#'                           ex.mmf.seq,
#'                           ex.sheet.data.interest.rate)
#'
#' # Selecting sequence ID which max NPV
#' ex.mmf.npv.max <- which.max(ex.mmf.npv[[3]])
#'
#' ex.mmf.sched <- ex.mmf.npv[[1]]
#' ex.mmf.npv <- ex.mmf.npv[[2]] 
#' ex.mmf.npv.sum <- ex.mmf.npv[[3]]
#'
#' # Index of sequence with max NPV
#' # ex.mmf.npv.max <- which.max(ex.mmf.npv.sum)
#' 
#' # Value of max NPV
#' ex.mmf.npv.max.value <- ex.mmf.npv.sum[[ex.mmf.npv.max]]
#' 
#' # Sequence with best NPV
#' ex.mmf.npv.max.sequence <- ex.mmf.seq[ex.mmf.npv.max]
#' 
#' # Schedule of sequence with best NPV
#' ex.mmf.npv.max.sched <- ex.mmf.sched[ex.mmf.npv.max]
#'

mmf.npv <- mmf_npv <- 
  function(cfs, durations, all.sequences, interest.rate) {
    
  all.shedules <- schedules.1r(all.sequences, durations)
  
  all.npv <- list()
  all.npv.sum <- list()
  
  for (count in 1:length(all.shedules)) {
    last.start <- tail(all.shedules[[count]],1)
    current.schedule.npv <- list()
    current.schedule.npv.sum <- 0
    
    for (activity in 1:length(all.sequences[[count]])) {
      current.activity.id <- all.sequences[[count]][[activity]]
      current.activity.start <- all.shedules[[count]][[activity]]
      #print(c("current.activity.id: ", current.activity.id ))
      current.activity.cfs <- unlist(cfs[current.activity.id,], use.names=FALSE)
      
      current.activity.cfs <- (c(rep.int(0, current.activity.start - 1), 
              current.activity.cfs[1:(length(current.activity.cfs) - (current.activity.start - 1))]))
      #print(c("current.activity.start: ", current.activity.start))
      #print(c("current.activity.cfs: ", current.activity.cfs ))
      
      current.schedule.npv[[activity]] <- current.activity.cfs
      # TODO: Retornar já a soma das colunas nominal e descontado.
      
      current.activity.npv <- net.present.value(current.activity.cfs, interest.rate)
      current.activity.npv.sum <- sum(current.activity.npv)
      
      current.schedule.npv.sum <- current.schedule.npv.sum + current.activity.npv.sum
      #print(c("current.activity.npv.sum: ", current.activity.npv.sum))
      #print("_________")
    }
    all.npv[[count]] <- current.schedule.npv
    all.npv.sum[count] <- current.schedule.npv.sum
    
  }
  return(list(all.shedules, all.npv, all.npv.sum))
}

# # TEST
source("ifm/R/excel.xls.to.list.R")
source("ifm/R/mmf.all.sequences.R")
source("ifm/R/net.present.value.R")
source("ifm/R/draw.cfs.R")
source("ifm/R/draw.discounted.cash.R")
source("ifm/R/mmf.max.npv.R")
source("ifm/R/mmf.df.1r.R")
source("ifm/R/schedules.1r.R")
source("ifm/R/mmf.get.breakeven.R")
source("ifm/R/mmf.get.selffunding.R")
source("ifm/R/draw.mmf.npv.R")

ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")
ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
ex.sheet.data.activities <- ex.sheet.data[[2]]
ex.sheet.data.durations <- ex.sheet.data[[3]]
ex.sheet.data.predecessors <- ex.sheet.data[[4]]
ex.sheet.data.cfs <- ex.sheet.data[[5]]

ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)

ex.mmf <- mmf.npv(ex.sheet.data.cfs,
                  ex.sheet.data.durations,
                  ex.mmf.seq,
                  ex.sheet.data.interest.rate)

ex.mmf.sched <- ex.mmf[[1]]
ex.mmf.npv <- ex.mmf[[2]]
ex.mmf.npv.sum <- ex.mmf[[3]]

ex.mmf.npv.breakeven <- mmf.get.breakeven(ex.mmf.npv)

ex.mmf.npv.selffunding <- mmf.get.selffunding(ex.mmf.npv)

# Generates a dataframe with all values
ex.mmf.df.1r <- mmf.df.1r(ex.mmf.seq,
                          ex.mmf.sched, 
                          ex.mmf.npv.sum, 
                          ex.mmf.npv.breakeven,
                          ex.mmf.npv.selffunding)

# Plot sorted NPV
draw.mmf.npv(ex.mmf.df.1r["npv"])

# # TODO: Change mmf.max.npv to extract info from dataframe
# ex.mmf.npv.max <- mmf.max.npv(ex.mmf.npv.sum, ex.mmf.seq, ex.mmf.sched)
# ex.mmf.npv.max.id <- ex.mmf.npv.max[[1]]
# ex.mmf.npv.max.sequence <- ex.mmf.npv.max[[2]]
# ex.mmf.npv.max.sched <- ex.mmf.npv.max[[3]]
# ex.mmf.npv.max.value <- ex.mmf.npv.max[[4]]
# 
# # Matrix with CFS of each activity for this sequence
# ex.mmf.npv.matrix <- matrix(unlist(ex.mmf.npv[[ex.mmf.npv.max.id]]),
#                             ncol = length(ex.mmf.npv[[ex.mmf.npv.max.id]][[1]]),
#                             byrow=T)
# 
# draw.cfs(colSums(ex.mmf.npv.matrix))
# 
# # To plot "Discounted Cash vs Time"
# ex.mmf.npv.discounted.cash <- cumsum(colSums(ex.mmf.npv.matrix))
# ex.mmf.npv.discounted.time <- c(0, ex.mmf.npv.max.sched[[1]])
# 
# draw.discounted.cash(ex.mmf.npv.discounted.cash)

# # TODO: Validate Excel!!!
