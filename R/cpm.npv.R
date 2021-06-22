cpm.npv <- function(cfs,
                    schedules,
                    interest.rate,
                    begin.of.period = FALSE) {

  all.cfs.stream <- list()
  all.cfs.nominal <- list()
  all.cfs.discounted <- list()
  all.npv <- list()

  for (count in 1:nrow(schedules)) {
    current.schedule.cfs <- list()
    current.schedule.npv <- 0
    current.activity.id <- 1
    for (current.activity.start in schedules[count,]) {
      current.unlist.cfs <- unlist(cfs[current.activity.id,], use.names=FALSE)

      current.activity.cfs <- (c(rep.int(0, current.activity.start),
                                 current.unlist.cfs[1:(length(current.unlist.cfs) - (current.activity.start))]))

      current.schedule.cfs[[current.activity.id]] <- current.activity.cfs

      current.activity.npv <- net.present.value(current.activity.cfs, interest.rate, begin.of.period)
      current.schedule.npv <- current.schedule.npv + current.activity.npv

      current.activity.id <- current.activity.id + 1
    }
    all.cfs.stream[[count]] <- current.schedule.cfs
    all.cfs.nominal[[count]] <- colSums(matrix(unlist(current.schedule.cfs),
                                               ncol = length(current.schedule.cfs[[1]]),
                                               byrow = T))
    all.cfs.discounted[[count]] <- discounted.csf(all.cfs.nominal[[count]],
                                                  interest.rate,
                                                  begin.of.period)
    all.npv[[count]] <- current.schedule.npv
  }

  return(list(cfs.stream=all.cfs.stream,
              cfs.nominal=all.cfs.nominal,
              cfs.discounted=all.cfs.discounted,
              npv=all.npv))
}

# ex.cpm.npv <- cpm.npv(ex.sheet.data.cfs,
#                      ex.cpm.schedules,
#                      ex.sheet.data.interest.rate)
