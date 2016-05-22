draw.mmf.sf.be <- function(df.complete) {
  # separa os dados que quero usar a partir do dataframe completo
  df <- subset(df.complete, select = selffunding:breakeven)
  
  # cria nova coluna com o valor da diferença entre be e sf, para mostrar 
  #corretamente no barplot
  be <- as.numeric(as.character(df$breakeven))
  sf <- as.numeric(as.character(df$selffunding))
  df$breakeven <- be-sf
  
  my.colors <- c('black','gray')
  # ordena o dataframe por breakeven
  barplot(t(df),
          col = my.colors,
          horiz = TRUE,
          ylab = "Sequence ID",
          xlab = "Period of Time",
          main = "SF vs BE",
          density = c(20,100)
          )
  
  legend("topright", c('Selffunding','Breakeven'), 
         cex = 0.8, fill = my.colors, density = c(20,100))
}

draw.mmf.sf.be(ex.mmf.df.1r)