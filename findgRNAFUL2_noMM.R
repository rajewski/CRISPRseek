source("https://bioconductor.org/biocLite.R")
biocLite("CRISPRseek")
biocLite("GenomicFeatures")
install.packages("~/shared/Nobtusifolia/Genome_Files/BSgenome.Nobt.Masked.MPGICE.1.0_1.0.tar.gz")
library(CRISPRseek)
library(GenomicFeatures)
library(BSgenome.Nobt.Masked.MPGICE.1.0)
txdb <- loadDb("~/shared/Nobtusifolia/Genome_Files/Robjects/TxDb.Nobt.MPGICE.1.0")
ncores <- 16
REpatternFile <- system.file("extdata", "NEBenzymes.fa", package = "CRISPRseek")

FUL2 <- `BSgenome.Nobt.Masked.MPG-ICE.1.0`$scaffold584[385523:395617] #5' end

results <- offTargetAnalysis(inputFilePath = DNAStringSet(FUL2), format = "fasta",
                             findgRNAsWithREcutOnly = TRUE, findPairedgRNAOnly = FALSE, 
                             BSgenomeName = BSgenome.Nobt.Masked.MPGICE.1.0, enable.multicore = TRUE, n.cores.max = ncores, 
                             topN= 20, chromToSearch = "all", txdb = txdb, max.mismatch = 0, 
                             outputDir = "~/CRISPR/resultsFUL2_noMM", overwrite = TRUE, gRNAoutputName = "Results")
