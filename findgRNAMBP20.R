#source("https://bioconductor.org/biocLite.R")
#biocLite("CRISPRseek")
#biocLite("GenomicFeatures")
#install.packages("~/shared/Nobtusifolia/Genome_Files/Robject/BSgenome.Nobt.Masked.MPGICE.1.0_1.0.tar.gz")
library(CRISPRseek)
library(GenomicFeatures)
library(BSgenome.Nobt.Masked.MPGICE.1.0)
txdb <- loadDb("~/shared/Nobtusifolia/Genome_Files/Robjects/TxDb.Nobt.MPGICE.1.0")
ncores <- 16
REpatternFile <- system.file("extdata", "NEBenzymes.fa", package = "CRISPRseek")

results <- offTargetAnalysis(inputFilePath = "~/CRISPR/loci/MBP20.fasta", format = "fasta",
                             findgRNAsWithREcutOnly = TRUE, findPairedgRNAOnly = FALSE, 
                             BSgenomeName = BSgenome.Nobt.Masked.MPGICE.1.0, enable.multicore = TRUE, n.cores.max = ncores, 
                             topN= 20, chromToSearch = "all", txdb = txdb, max.mismatch = 0, scoring.method = "CFDscore",
                             outputDir = "~/CRISPR/results/MBP20", overwrite = TRUE, gRNAoutputName = "Results")
