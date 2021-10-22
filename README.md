
# GOEA analyses implicates ubiquitin-like ISG15 modifier in ribonucleoprotein complex dynamics

ISG15 is a ubiquitin-like modifier that is co-translationally conjugated to hundreds of intracellular proteins. 

There have been 5 studies with published ISG15-conjugate proteomics within the last 3 years, however, our interpretation of these lists are constrained by reduced publication frequency starting in the late 2000s. 

We therefore coupled GOEA visualizations with Genewalk interpretations to describe the system-level context of the ISGylome.

## Description

## Getting Started

### Dependencies

* R 4.1+
* Unix shell

### Executing program

* From the main directory commandline, execute:
```
Rscript process_GOST.R JOB_ID ORGDB GOID THRESHOLD INPUT_PATH
```
where:
JOB_ID is a user-generated identifier
ORGDB is a organisms genome annotation (org.Hs.eg.db for Homo sapiens)
GOID is one of BP, MF, and CC depending on user interest
THRESHOLD is the user-defined cut-off for semantic similarity reduction
INPUT_PATH is the/file/path/ to a gProfiler GOEA.csv

* Semantic similarity and the reduced GO profile of the input is stored in ./jobs/JOB_ID
* To quickly visualize the reduced data, execute in commandline:

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
