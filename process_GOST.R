library(rrvgo)

# execute in command line:
# Rscript process_GOST.R[0] JOB_ID[1] ORGDB[2] GOID[3] THRESHOLD[4] INPUT_PATH[5]

# param@ JOB_ID user-defined identifier
# param@ ORGDB gene ontology oranism database 
# param@ GOID 2-letter symbol for the main GO branch of interest
# param@ THRESHOLD cut-off for semantic similarity; 0 - 1.0
# param@ INPUT_PATH file path to g:Profiler csv analysis


args <- commandArgs(trailingOnly=TRUE)

library(rrvgo)

dir.create(file.path('jobs', args[1]))

# user dataset in folder GOEA is imported
FILE_NAME <- read.csv(args[5], header=TRUE)

# calculate semantic similarity
simMatrix <- calculateSimMatrix(
  
  FILE_NAME$term_id,
  orgdb = args[2], # org.Hs.eg.db
  ont = args[3],    # 'BP', 'MF', or 'CC'
  method = 'Rel'
  )

OUTPUT_PATH <- file.path(
  'jobs', 
  args[1], 
  paste(args[1],'_th',args[4],'_GO',args[3],'_semsim.csv', sep='')
)

# semsim analysis is outputted to a csv file saved in OUTPUT_PATH
write.csv(
  simMatrix,
  OUTPUT_PATH,
  row.names = FALSE)


# reduce semantically similar terms; scored by significance  
reducedTerms <- reduceSimMatrix(
  simMatrix, 
  scores = FILE_NAME$`negative_log10_of_adjusted_p_value`,
  threshold = args[4],
  orgdb = args[2]
  )

OUTPUT_PATH <- file.path(
  'jobs', 
  args[1], 
  paste(args[1],'_th', args[4], '_GO', args[3], '_reducedterms.csv', sep='')
)

write.csv(
  reducedTerms,
  OUTPUT_PATH,
  row.names = FALSE)


