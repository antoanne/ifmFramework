# TESTS Antoanne
source("ifm/R/excel.xls.to.list.R")
# source("ifm/R/mmf.all.sequences.R")
# source("ifm/R/net.present.value.R")
# source("ifm/R/draw.cfs.R")
# source("ifm/R/draw.discounted.cash.R")
# source("ifm/R/mmf.max.npv.R")
# source("ifm/R/mmf.df.1r.R")
# source("ifm/R/schedules.1r.R")
# source("ifm/R/mmf.get.breakeven.R")
# source("ifm/R/mmf.get.selffunding.R")
# source("ifm/R/draw.mmf.npv.R")
# source("ifm/R/mmf.npv.R")

ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")
ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
ex.sheet.data.activities <- ex.sheet.data[[2]]
ex.sheet.data.durations <- ex.sheet.data[[3]]
ex.sheet.data.predecessors <- ex.sheet.data[[4]]
ex.sheet.data.cfs <- ex.sheet.data[[5]]

# ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)
# 
# ex.mmf <- mmf.npv(ex.sheet.data.cfs,
#                   ex.sheet.data.durations,
#                   ex.mmf.seq,
#                   ex.sheet.data.interest.rate)
# 
# ex.mmf.sched <- ex.mmf[[1]]
# ex.mmf.npv <- ex.mmf[[2]]
# ex.mmf.npv.sum <- ex.mmf[[3]]
# 
# ex.mmf.npv.breakeven <- mmf.get.breakeven(ex.mmf.npv)
# 
# ex.mmf.npv.selffunding <- mmf.get.selffunding(ex.mmf.npv)
# 
# # Generates a dataframe with all values
# ex.mmf.df.1r <- mmf.df.1r(ex.mmf.seq,
#                           ex.mmf.sched, 
#                           ex.mmf.npv.sum, 
#                           ex.mmf.npv.breakeven,
#                           ex.mmf.npv.selffunding)
# 
# # Plot sorted NPV
# draw.mmf.npv(ex.mmf.df.1r["npv"])
# 
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