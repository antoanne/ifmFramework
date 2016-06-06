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

fooDenne <- function() {
  
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

  # plotar 4 figuras por página, daqui para frente.
  par(mfrow=c(2,2))
  
  ##########################################
  ## EXEMPLO PARA 1 RECURSO = allTopSort ###
  #gera todas as sequências possíveis
  ex.mmf.seq <- mmf.all.sequences(ex.sheet.data.predecessors)
  
  # calcula o NPV de todas as sequências
  ex.mmf <- mmf.npv(ex.sheet.data.cfs,
                    ex.sheet.data.durations,
                    ex.mmf.seq,
                    ex.sheet.data.interest.rate)
  
  ex.mmf.schedules <- ex.mmf[['schedules']]
  ex.mmf.cfs.stream <- ex.mmf[['cfs.stream']]
  ex.mmf.cfs.nominal <- ex.mmf[['cfs.nominal']]
  ex.mmf.cfs.discounted <- ex.mmf[['cfs.discounted']]
  ex.mmf.npv <- ex.mmf[['npv']]
  
  # calcula o selfunding e breakeven para cada uma das sequências
  ex.mmf.npv.selffunding <- mmf.get.selffunding(ex.mmf.cfs.discounted)
  ex.mmf.npv.breakeven <- mmf.get.breakeven(ex.mmf.cfs.discounted)
  
  # gera o dataframe com todas as informações
  ex.mmf.df.1r <- mmf.df.1r(ex.mmf.seq,
                            ex.mmf.schedules,
                            ex.mmf.npv,
                            ex.mmf.npv.selffunding,
                            ex.mmf.npv.breakeven)
  
  # plota o NPV x Sequência, ordenado por NPV
  draw.mmf.npv(ex.mmf.df.1r["npv"])
  
  # busca o max NPV
  ex.mmf.npv.max <- mmf.max.npv(ex.mmf.npv, ex.mmf.seq, ex.mmf.schedules)
  ex.mmf.npv.max.id <- ex.mmf.npv.max['id']
  ex.mmf.npv.max.sequence <- ex.mmf.npv.max['sequence']
  ex.mmf.npv.max.schedule <- ex.mmf.npv.max['schedule']
  ex.mmf.npv.max.value <- ex.mmf.npv.max['value']

  # desenha o fluxo de caixa da sequência com melhor NPV
  draw.cfs(unlist(ex.mmf.cfs.nominal[ex.mmf.npv.max.id[[1]]]), to.file = TRUE)
  
  # desenha o fluxo de caixa acumulado como o exemplo do Denee.
  draw.discounted.cash(unlist(ex.mmf.cfs.discounted[ex.mmf.npv.max.id[[1]]]), 30)
  
  # plotar SF x BE
  draw.mmf.sf.be(ex.mmf.df.1r)
  
  listaImagens <- list(ex.graph.image.path, 
                       "output/draw.mmf.npv.png", 
                       "output/draw.cfs.graph.png", 
                       "output/draw.discounted.cash.png",
                       "output/draw.mmf.sf.be.png")
  
  listaToExcel <- list(ex.mmf.df.1r, listaImagens)
  
  # Salvar no excel
  ex.file.path <- excel.list.to.xls(listaToExcel)
}