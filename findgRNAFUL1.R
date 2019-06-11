source("https://bioconductor.org/biocLite.R")
biocLite("CRISPRseek")
biocLite("GenomicFeatures")
install.packages("~/shared/Nobtusifolia/Genome_Files/BSgenome.Nobt.Masked.MPGICE.1.0_1.0.tar.gz")
library(CRISPRseek)
library(GenomicFeatures)
library(BSgenome.Nobt.Masked.MPGICE.1.0)
txdb <- loadDb("~/shared/Nobtusifolia/Genome_Files/TxDb.Nobt.MPGICE.1.0")
ncores <- 4
REpatternFile <- system.file("extdata", "NEBenzymes.fa", package = "CRISPRseek")


results <- offTargetAnalysis(inputFilePath = "~/CRISPR/loci/NobtFUL1-5.fa", format = "fasta", findgRNAsWithREcutOnly = TRUE, 
                             findPairedgRNAOnly = FALSE, BSgenomeName = BSgenome.Nobt.Masked.MPGICE.1.0, 
                             enable.multicore = TRUE, n.cores.max = ncores, topN= 20, chromToSearch = "all", txdb = txdb, max.mismatch = 0, 
                             outputDir = "~/CRISPR/results/FUL1",overwrite = TRUE)
