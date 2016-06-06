# importa os códigos do pacote
# só deve ser executado se o pacote não for instalado na máquina.
source("ifm/R/utils.R")
source("ifm/R/excel.xls.to.list.R")
source("ifm/R/net.present.value.R")
source("ifm/R/net.future.value.R")
source("ifm/R/discount.rate.vector.R")
source("ifm/R/mmf.all.sequences.R")
source("ifm/R/mmf.npv.R")
source("ifm/R/schedules.1r.R")
source("ifm/R/mmf.max.npv.R")
source("ifm/R/mmf.df.1r.R")
source("ifm/R/mmf.df.infr.R")
source("ifm/R/mmf.get.breakeven.R")
source("ifm/R/mmf.get.selffunding.R")
source("ifm/R/discounted.csf.R")
source("ifm/R/predecessors.to.edges.R")
source("ifm/R/cpm.R")
source("ifm/R/cpm.npv.R")
source("ifm/R/cpm.all.schedule.R")
source("ifm/R/draw.cfs.R")
source("ifm/R/draw.graph.R")
source("ifm/R/draw.mmf.npv.R")
source("ifm/R/draw.mmf.sf.be.R")
source("ifm/R/draw.discounted.cash.R")

fooDeepPocket <- function(){
  
  # busca os dados da planilha
  ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")
  ex.sheet.data.interest.rate <- ex.sheet.data$interest.rate
  ex.sheet.data.activities <- ex.sheet.data$activities
  ex.sheet.data.durations <- ex.sheet.data$durations
  ex.sheet.data.predecessors <- ex.sheet.data$predecessors
  ex.sheet.data.cfs <- ex.sheet.data$cash.flow.series

  ##########################################
  ## PLOTAR GRAFO
  edges <- predecessors.to.edges(ex.sheet.data.predecessors)
  ex.graph.image.path <- draw.graph(edges)

  #######################################
  ### EXEMPLO PARA inf RECURSOS = CPM ###
  # transforma a lista de predecessores em lista de sucessores
  ex.sheet.data.successors <- utils.pred2suc(ex.sheet.data.predecessors)
  
  # calcula o CPM para a lista de sucessores com a lista de durações
  ex.cpm.data <- cpm(ex.sheet.data.durations,
                     ex.sheet.data.successors)
  
  # calcula toras as agendas em CPM
  ex.cpm.schedules <- cpm.all.schedule(ex.cpm.data)
  
  # calcula o NPV de todas as sequências
  ex.cpm <- cpm.npv(ex.sheet.data.cfs,
                    ex.cpm.schedules,
                    ex.sheet.data.interest.rate)
  
  ex.cpm.cfs.stream <- ex.cpm[['cfs.stream']]
  ex.cpm.cfs.nominal <- ex.cpm[['cfs.nominal']]
  ex.cpm.cfs.discounted <- ex.cpm[['cfs.discounted']]
  ex.cpm.npv <- ex.cpm[['npv']]
  
  # calcula o selfunding e breakeven para cada uma das sequências
  ex.cpm.npv.selffunding <- mmf.get.selffunding(ex.cpm.cfs.discounted)
  ex.cpm.npv.breakeven <- mmf.get.breakeven(ex.cpm.cfs.discounted)
  
  # gera o dataframe com todas as informações
  ex.cpm.df.infr <- mmf.df.infr(ex.cpm.schedules,
                                ex.cpm.npv,
                                ex.cpm.npv.selffunding,
                                ex.cpm.npv.breakeven)
  
  # busca o max NPV - TODO: Melhorar!
  ex.cpm.schedules.list <- list()
  for(i in 1:nrow(ex.cpm.schedules)) {
    ex.cpm.schedules.list <- c(ex.cpm.schedules.list, toString(ex.cpm.schedules[i,]))
  }
  
  ex.cpm.npv.max <- mmf.max.npv(ex.cpm.npv, NULL, ex.cpm.schedules.list)
  ex.cpm.npv.max.id <- ex.cpm.npv.max['id']
  ex.cpm.npv.max.schedule <- ex.cpm.npv.max['schedule']
  ex.cpm.npv.max.value <- ex.cpm.npv.max['value']
  
  # plota o NPV x Sequência, ordenado por NPV
  draw.mmf.npv(ex.cpm.df.infr["npv"])
  
  # desenha o fluxo de caixa da sequência com melhor NPV
  draw.cfs(unlist(ex.cpm.cfs.nominal[ex.cpm.npv.max.id[[1]]]))
  
  # desenha o fluxo de caixa acumulado como o exemplo do Denee.
  draw.discounted.cash(unlist(ex.cpm.cfs.discounted[ex.cpm.npv.max.id[[1]]]), 30)
  
  # plotar SF x BE
  draw.mmf.sf.be(ex.cpm.df.infr)
  
  listaImagens <- list(ex.graph.image.path, 
                       "output/draw.mmf.npv.png", 
                       "output/draw.cfs.graph.png", 
                       "output/draw.discounted.cash.png",
                       "output/draw.mmf.sf.be.png")
  
  listaToExcel <- list(ex.mmf.df.1r, listaImagens)
  
  # Salvar no excel
  ex.file.path <- excel.list.to.xls(listaToExcel)
  
}