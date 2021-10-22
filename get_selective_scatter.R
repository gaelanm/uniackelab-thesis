# edited version of scatterPlot (ssayols) that allows labeling of specific terms underlying parent terms


library(rrvgo)
library(ggplot2)

simMatrix <- read.csv(args[1], header=TRUE, row.names=1)

reducedTerms <- read.csv(args[2], header=TRUE, row.names=1)


scatterPlot <- function(simMatrix, reducedTerms, 
                        size="score", addLabel=TRUE, 
                        labelSize=6.5, alpha=0.5) {
  
  if(!all(sapply(c("ggplot2", "ggrepel"), requireNamespace, quietly=TRUE))) {
    stop("Packages ggplot2, ggrepel and/or its dependencies not available. ",
         "Consider installing them before using this function.", call.=FALSE)
  }
  
  x <- cmdscale(as.matrix(as.dist(1-simMatrix)), eig=TRUE, k=2)
  
  df <- cbind(as.data.frame(x$points),
              reducedTerms[match(rownames(x$points), reducedTerms$go), c("term", "parent", "parentTerm", "size")]) 
  
  p <-
    ggplot2::ggplot(df, ggplot2::aes(x=V1, y=V2, color=parentTerm)) +
    ggplot2::geom_point(ggplot2::aes(size=size*2), alpha=alpha) +
    ggplot2::scale_color_discrete(breaks=c('cytoplasmic stress granule', 'ribonucleoprotein complex'), name='Parent term') + # edit breaks with PTs of interest
    ggplot2::scale_size_continuous(guide=FALSE, range=c(0, 25)) +
    ggplot2::scale_x_continuous(name="") +
    ggplot2::scale_y_continuous(name="") +
    ggplot2::theme(axis.text.x=ggplot2::element_blank(), 
                   axis.text.y=ggplot2::element_blank(),
                   axis.ticks=element_blank(),
                   legend.position='none')
  
  if(addLabel) {
    p + ggrepel::geom_label_repel(aes(label=term),
                                  data=subset(df, parentTerm == 'cytoplasmic stress granule' | parentTerm == 'ribonucleoprotein complex'), # subset labeling using OR operand
                                  box.padding=grid::unit(1, "lines"), size=labelSize)
  } else {
    p
  }
}

options(ggrepel.max.overlaps = Inf)

## 465 X 325
scatterPlot(simMatrix, data)

#barchart
