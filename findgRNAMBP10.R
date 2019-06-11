source("https://bioconductor.org/biocLite.R")
biocLite("CRISPRseek")
biocLite("GenomicFeatures")
install.packages("~/shared/Nobtusifolia/Genome_Files/Robjects/BSgenome.Nobt.Masked.MPGICE.1.0_1.0.tar.gz")
library(CRISPRseek)
library(GenomicFeatures)
library(BSgenome.Nobt.Masked.MPGICE.1.0)
txdb <- loadDb("~/shared/Nobtusifolia/Genome_Files/Robjects/TxDb.Nobt.MPGICE.1.0")
ncores <- 16
REpatternFile <- system.file("extdata", "NEBenzymes.fa", package = "CRISPRseek")

MBP10 <- `BSgenome.Nobt.Masked.MPG-ICE.1.0`$scaffold67[35750:33014] #5' end

results <- offTargetAnalysis(inputFilePath = "~/CRISPR/loci/MBP10.fasta", format = "fasta",
                             findgRNAsWithREcutOnly = TRUE, findPairedgRNAOnly = FALSE, 
                             BSgenomeName = BSgenome.Nobt.Masked.MPGICE.1.0, enable.multicore = TRUE, n.cores.max = ncores, 
                             topN= 20, chromToSearch = "all", txdb = txdb, max.mismatch = 0, scoring.method = "CFDscore", 
                             outputDir = "~/CRISPR/results/MBP10", overwrite = TRUE, gRNAoutputName = "Results")
