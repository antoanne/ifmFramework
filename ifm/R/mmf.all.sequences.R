#' Generates all MMF sequences (topsorts)
#' 
#' @name mmf.all.sequences
#' 
#' @aliases mmf_all_sequences
#' 
#' @param predecessors List of Predecessors - Zero for none
#' 
#' @return List of all possible MMF sequences.
#' 
#' @export mmf.all.sequences
#' 
#' @keywords minimum marketable features, scheduling, project activities
#' 
#' @family scheduling
#' 
#' @examples 
#' 
#' ex.activities.predecessors<-list(0,1,2,3,1,5,c(4,6))
#' ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
#' 
mmf.all.sequences <- mmf_all_sequences <-
  function(predecessors = 0){

  #Local Variables
  i<-0                           #1-sequence counter                          
  current.sequence<-vector()     #2-current sequence
  sorts.list<-list()             #3-list of sorts
  
  #Algorithm
  genAllTopSorts<-function(current.sequence, n=1){    
    current.sequence<-c(current.sequence, n)
    #end of sequence
    if (length(current.sequence) == length(predecessors)){
      i<<-i+1
      sorts.list[[length(sorts.list)+1]]<<-current.sequence
    }
    
    #find candidates = (All - p) 
    candidates <-setdiff(1:length(predecessors), current.sequence)
    
    #find eligibles = candidates with predecessors done ie in p
    eligibles<-vector()
    for (j in candidates){
      t <- predecessors[[j]]
      if (length(setdiff(t, current.sequence))==0){
        eligibles<-union(eligibles, j)    
      }
    }
    
    #recurse depth first on eligibles
    for (k in eligibles) {
      genAllTopSorts(current.sequence, k)}            
  }
  
  genAllTopSorts(current.sequence,1)
  return(sorts.list)
}