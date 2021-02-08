
" Example analysis using the rrvgo tool; heatmap, cluster map, and tree map of
cluster 2 of ISG15 targets in Zhang et al. 2019 doi.org/10.1038/s41467-019-13393-x

Targets represent ISG12 targets induced in mice hepatic cells following Listeria
infection. "

library(rrvgo)
library(org.Hs.eg.db)

file_path <- file.path('..', 'gProfiler', 'data', 'gProfiler_zhang2019_cluster2.csv')

go_terms <- read.delim(file_path, sep=",", header=TRUE)

#    returns n x n similarity matrix comparing all go term pairs
simMatrix <- calculateSimMatrix(go_terms$ID,
                                orgdb="org.Mm.eg.db",
                                ont="BP",
                                method="Rel")

#    set negative log p-value as the ranking scheme for all go terms
scores <- setNames(go_terms$score, go_terms$ID)

#    representative term is selected by score/similarity threshold
#    score is optional; if omitted the representative term is weighted by term size
reducedTerms <- reduceSimMatrix(simMatrix,
                                scores,
                                threshold=0.7,
                                orgdb="org.Mm.eg.db")

heatmapPlot(simMatrix,
            reducedTerms,
            annotateParent=TRUE,
            annotationLabel="parentTerm",
            fontsize=6)

scatterPlot(simMatrix, reducedTerms)

treemapPlot(reducedTerms)
