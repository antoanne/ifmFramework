source('..\\mmf.all.sequences.R')

test.examples <- function() {
  # ex.activities.predecessors<-list(0,1,2,3,5)
  # ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  # print(ex.mmf.seq)
  # checkEquals(7963.248,sum(ex.npv)  )

  # ex.activities.predecessors<-list(0,1,2,3,1,5,c(4,6))  
  #ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  #print(ex.mmf.seq)
  #ex.activities.predecessors<-list(0,1,2,3,c(3,4),6)  
  # ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  ex.activities.predecessors<-list(0,1,2,3,1,5,c(4,6))
  ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  print(ex.mmf.seq)
}

test.deactivation <- function()
{
  DEACTIVATED('Deactivating this test function')
}
