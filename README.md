# Ecosystem services in Eastern and Southern Africa for the 2nd edition of the *State of Protected and Conserved Areas in Eastern and Southern Africa report*

This repository contains the R-scripts needed to replicate the statistical analysis in the following manuscript:

Buschke, F.T. & Capitani, C. (In prep) The values of ecosystem services inside and outside of protected areas in Eastern and Southern Africa.

## Data availability
The data used in the analysis are from the [Ecosystem Service Valuation Database]( https://www.esvd.net/) as of 31 May 2023

## Dependencies
The analysis requires the `lme4` and `RColorBrewer packages`

## Repository structure
The repository is made of four files:
* `GLME_Model.R` -- The script needed to replicate the analysis.
* ` ES_clean.csv` -- A cleaned version of the [Ecosystem Service Valuation Database]( https://www.esvd.net/), based on the data inclusion rules outlined in the accompanying manuscript.
* `Figure 2.png` -- The output showing the model prediction of ecosystem value for different types of ecosystem services inside and outside of protected areas. Generated automatically by the script `GLME_Model.R`.
* `Figure S2.png` -- The output showing the model diagnostic plots. Generated automatically by the script `GLME_Model.R`.

