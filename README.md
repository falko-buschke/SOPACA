# Ecosystem services in Eastern and Southern Africa for the 2nd edition of the *State of Protected and Conserved Areas in Eastern and Southern Africa report*

This repository contains the R-scripts needed to replicate the statistical analysis in the following manuscript:

Buschke, F.T. & Capitani, C. (2023) [The values of ecosystem services inside and outside of protected areas in Eastern and Southern Africa](https://doi.org/10.1101/2023.09.27.559741).BioRxiv.

## Data availability
The data used in the analysis are from the [Ecosystem Service Valuation Database]( https://www.esvd.net/) as of 31 May 2023

## Dependencies
The analysis requires the `lme4` and `RColorBrewer packages`

## Repository structure
The repository is made of the following files:

### Input data
* ` ES_clean.csv` -- A cleaned version of the [Ecosystem Service Valuation Database]( https://www.esvd.net/), based on the data inclusion rules outlined in the accompanying manuscript.
<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/Fig1_Map.png" alt="Study Area" width="700"/>

### Decision tree for data inclusion
* `Data_Inclusion.R` -- An R-script to recreat Figure 2, which outlines the the decision tree followed to include or exclude data records.
<img src="https://github.com/falko-buschke/SOPACA/blob/main/Figure2.png" alt="Data Inclusion rules" width="700"/>



* `GLME_Model.R` -- The script needed to replicate the analysis.
* `Figure 2.png` -- The output showing the model prediction of ecosystem value for different types of ecosystem services inside and outside of protected areas. Generated automatically by the script `GLME_Model.R`.
* `Figure S2.png` -- The output showing the model diagnostic plots. Generated automatically by the script `GLME_Model.R`.

