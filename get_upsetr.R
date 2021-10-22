file_path <- file.path()

targets <- read.csv(file_path,
                    check.names=F,
                    na.strings="")
 

# remove NA
data <- list()
for(i in 1:ncol(targets)) {
  
  interm <- targets[,i][!is.na(targets[,i])]
  
  data[[names(targets[i])]] <- interm
  
}

upset(fromList(data),
      nsets=13,
      nintersects=NA,
      point.size=4.2, 
      line.size=1, 
      mainbar.y.label="GO:BP Intersections",
      sets.x.label="Number of GO Annotations",
      mb.ratio = c(0.7,0.3),
      text.scale = c(2, 1.7, 1.3, 1.3, 1.5, 1.5),
      matrix.color = '#171d22',
      order.by=c("freq", "degree"),
      decreasing=c(T,F)
)
