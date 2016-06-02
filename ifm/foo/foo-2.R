fooQqCoisa <- function () {
  
  ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")
  ex.sheet.data.interest.rate <- ex.sheet.data$interest.rate
  ex.sheet.data.activities <- ex.sheet.data$activities
  ex.sheet.data.durations <- ex.sheet.data$durations
  ex.sheet.data.predecessors <- ex.sheet.data$predecessors
  ex.sheet.data.cfs <- ex.sheet.data$cash.flow.series
  
  ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)
  
  ex.mmf <- mmf.npv(ex.sheet.data.cfs,
                    ex.sheet.data.durations,
                    ex.mmf.seq,
                    ex.sheet.data.interest.rate)
  
  ex.mmf.schedules <- ex.mmf[['schedules']]
  ex.mmf.cfs.nominal <- ex.mmf[['cfs.nominal']]
  ex.mmf.cfs.discounted <- ex.mmf[['cfs.discounted']]
  ex.mmf.npv <- ex.mmf[['npv']]
  
  ex.mmf.npv.selffunding <- mmf.get.selffunding(ex.mmf.cfs.discounted)
  ex.mmf.npv.breakeven <- mmf.get.breakeven(ex.mmf.cfs.discounted)
  
  ex.mmf.df.1r <- mmf.df.1r(ex.mmf.seq,
                            ex.mmf.schedules,
                            ex.mmf.npv,
                            ex.mmf.npv.selffunding,
                            ex.mmf.npv.breakeven)
  
  ex.mmf.df.1r
  
  # ex.file.path <- excel.list.to.xls(ex.mmf.df.1r)
  
}