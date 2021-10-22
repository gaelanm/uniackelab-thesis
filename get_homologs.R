
library(homologene)

FILES <- list.files(path='genesets', 
                    pattern='*.csv$', 
                    full.names=FALSE,
                    recursive=FALSE)

# lists of mouse genes are returned as human homolog files
get_homologs <- function(FILE, JOB_ID) {
  
  genes <- unlist(read.csv(FILE, header=FALSE))
  
  homologs <- mouse2human(genes, db=homologeneData2)
  
  OUT_PATH <- paste('homologs', 'file.ext')
  
  write.csv(homologs, OUT_PATH, row.names=FALSE)
  
}

lapply(FILES, get_homologs)
