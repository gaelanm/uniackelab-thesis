
# execute from command line:
# Rscript get_scatter.R semsim/file/path reduced/file/path
# A scatter plot (ggplot2) of semantically similar GOIDs using principle co-ordinate analysis

args <- commandArgs(trailingOnly=TRUE)

library(rrvgo)
library(ggplot2)

simMatrix <- read.csv(args[1], header=TRUE, row.names=1)

reducedTerms <- read.csv(args[2], header=TRUE, row.names=1)

scatterPlot(simMatrix, reducedTerms, addLabel=TRUE, labelSize=5)

options(ggrepel.max.overlaps = Inf)

scatterPlot(simMatrix, reducedTerms)
