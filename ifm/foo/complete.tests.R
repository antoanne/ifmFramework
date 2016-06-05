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

# busca os dados da planilha
ex.sheet.data <- excel.xls.to.list("resources/spreadsheet.xls")
  ex.sheet.data.interest.rate <- ex.sheet.data[[1]]
  ex.sheet.data.activities <- ex.sheet.data[[2]]
  ex.sheet.data.durations <- ex.sheet.data[[3]]
  ex.sheet.data.predecessors <- ex.sheet.data[[4]]
  ex.sheet.data.cfs <- ex.sheet.data[[5]]

##########################################
## PLOTAR GRAFO
edges <- utils.pred2graph(ex.sheet.data.predecessors)
g <- make_graph(edges, directed = TRUE )
plot(g)
# ex.graph.image.path <- draw.graph(edges)
# print(ex.graph.image.path)

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
draw.cfs(unlist(ex.mmf.cfs.nominal[ex.mmf.npv.max.id[[1]]]))

# desenha o fluxo de caixa acumulado como o exemplo do Denee.
draw.discounted.cash(unlist(ex.mmf.cfs.discounted[ex.mmf.npv.max.id[[1]]]))

# plotar SF x BE
draw.mmf.sf.be(ex.mmf.df.1r)

# Salvar no excel
#ex.file.path <- excel.list.to.xls(ex.mmf.df.1r)

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

# plota o NPV x Sequência, ordenado por NPV
draw.mmf.npv(ex.cpm.df.infr["npv"])

# plotar SF x BE
draw.mmf.sf.be(ex.cpm.df.infr)

# # TODO: Change mmf.max.npv to extract info from dataframe
# ex.mmf.npv.max <- mmf.max.npv(ex.mmf.npv, ex.mmf.seq, ex.mmf.schedules)
# ex.mmf.npv.max.id <- ex.mmf.npv.max['id']
# ex.mmf.npv.max.sequence <- ex.mmf.npv.max['sequence']
# ex.mmf.npv.max.schedule <- ex.mmf.npv.max['schedule']
# ex.mmf.npv.max.value <- ex.mmf.npv.max['value']
