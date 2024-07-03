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

**Figure 1**

<img src="https://github.com/falko-buschke/SOPACA/blob/main/Figure1.png" alt="Study Area" width="500"/>

### Decision tree for data inclusion
* `Data_Inclusion.R` -- An R-script to recreate Figure 2, which outlines the the decision tree followed to include or exclude data records.

**Figure 2**

<img src="https://github.com/falko-buschke/SOPACA/blob/main/Figure2.png" alt="Data Inclusion rules" width="500"/>

### Description of data

* `Data_Summary.R` -- An R-script to recreate the Figures in Appendix 2, which describe the balance of data.

**Figure S2**

<img src="https://github.com/falko-buschke/SOPACA/blob/main/DataBalance.png" alt="Data balance" width="800"/>

**Figure S3**

<img src="https://github.com/falko-buschke/SOPACA/blob/main/S1_balance_square.png" alt="Cross-tabulation matrices" width="800"/>

### Analysis scripts (Gamma generalised linear mixed-effects model with a log-link function)
* `GLME_Model.R` -- The script needed to replicate the analysis.

**Figure 3**

<img src="https://github.com/falko-buschke/SOPACA/blob/main/Figure3.png" alt="Model prediction" width="500"/>



