#!/bin/bash

# The point of this script is to reproduce a problem that I am having
# with the DADA2 pipeline, on a few select samples.
# Goal is allowing someone else to reproduce my problem.

# I start with three samples, all located in `./RenamedSamples/`
# I also have metadata in `SampleKey1.csv` and `SampleKey2.csv`

#First I trim my sequences, with cutadapt
sh Trim.sh

Rscript PlotQualityProfiles.R

Rscript FilterAndTrim.R

Rscript LearnErrors.R 

Rscript PlotReads.R

Rscript DerepInator.R 

Rscript DadaInator.R

Rscript MergeOnly.R

Rscript MakeTable.R

SlayChimeras.R 
# I'm concerned that there are too many chimeras 66% of all sequences.
# Also there are a *lot* of unique reads.
#I will make a reproducable example on just the GD samples and try to get help from
#DADA2 developers. In the mean time, I"ve checked that I've trimmed the primers, so I'm 
#going to proceed.

# Something about metadata here.

