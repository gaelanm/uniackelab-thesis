
# param@ z intersections of at least z number of genesets
# param@ targets

library(gtools)

file_path <- file.path()

targets <- read.csv(file_path,
                    check.names=F,
                    na.strings="")

# performs permutations of all intersections without keeping repeats
n_reduce <- function(z, targets) {
  
  user_data <- permutations(n=length(colnames(targets)),z,v=colnames(targets))
  output <- list()
  intersections <- list()
  
  for(i in 1:nrow(user_data)) {
    
    for(n in 1:ncol(user_data)) {
      intersections[n] <- data[user_data[i,n]]
      
    }
    
    r <- Reduce(intersect, intersections)
    
    output <- append(output, r)
    
    output <- unique(output)
    
  }
  return(output)
}

# example execution calling targets by column name(s)
shared_genes <- n_reduce(2, targets[c(
  'Pinto-Fernández et al. 2020', 
  'Wong et al. 2006',
  'Zhao et al. 2005')])
