
# Gene Ontology Enrichment Analysis implicates ubiquitin-like interferon-stimulated gene 15 (ISG15) in ribonucleoprotein complex dynamics

ISG15 is co-translationally conjugated to hundreds of intracellular targets using a set of ubiquitin E1, E2, and E3-like cysteine proteases. ISG15 is commonly upregulated in most cancers, and has been implicated in metastasis, epithelial-to-mesenchymal transition, and inflammation. Despite two decades of proteomic target identification, there has been no system-level description of ISG15 modification and most of our knowledge comes from limited targeted experiments.&nbsp;   

**Table of reported ISG15 target studies made by Thery *et al.* 2021**

![here](https://github.com/gaelanm/uniackelab-thesis/blob/main/assets/isg15_targets.jpg)

Inspired by the emergent properties of gene networks, we reasoned analysis of the common attributes among ISG15 targets would provide systems-level insights into the emergent properties of ISG15 modification. Here, we created a simple workflow leveraging the rrvgo and GoSemSim libraries to perform GOEA followed by semantic similarity analysis to reduce the enrichment space into major biological themes.

## Getting Started
This repository is undergoing constant changes as I develop better practices; please feel free to share any feedback.

### Dependencies

* R 4.1+
* Unix shell

### Executing program

* From the main directory commandline, execute:

```
Rscript process_GOST.R JOB_ID ORGDB GOID THRESHOLD INPUT_PATH
```

where:
* *JOB_ID* is a user-generated identifier
* *ORGDB* is a organisms genome annotation (ie org.Hs.eg.db, org.Mm.eg.db)
* *GOID* is BP, MF, or CC for specific GO branch
* *THRESHOLD* is the user-defined cut-off for semantic similarity reduction (0.0 - 1.0; higher values reduce the number of parent terms)
* *INPUT_PATH* is the/file/path/ to a gProfiler-generated GOEA.csv
* Semantic similarity and the reduced GO profile of the input is stored in ./jobs/JOB_ID
* Quickly visualize the reduced data in UNIX:

```
Rscript get_scatter.R path/to/semsim path/to/reducedterms
```

## Help
* to broaden or narrow the size of reduced terms, increase or decrease the threshold
* original scatterPlot function in rrvgo can also be edited in get_selective_scatter.R; altered settings should be run from the R console

## Authors

Gaelan Melanson

Jessica Whittaker

## Version History

* 

## References
<a id="1">1.</a> 
Narasimhan et al. (1996). 
Conjugation of the 15-kDa Interferon-induced Ubiquitin Homolog Is Distinct from That of Ubiquitin. 
JBC, 271(1), 324-330.

<a id="2">2.</a> 
Thery et al. (2021). 
Proteomics Mapping of the ISGylation Landscape in Innate Immunity. 
Front Immunol, 12, doi: 10.3389/fimmu.2021.720765.
