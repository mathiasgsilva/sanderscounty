rm(list=ls())
library(mgcv)
raw_data_dir <- "/home/mathias/Documents/Maestria/econometrics_project/2016-us-election"
scripts_dir <- "/home/mathias/Documents/Maestria/AMSE M2/AMSEM2/Advanced Econometrics"
setwd(raw_data_dir)

#1) Load data and clearing
source(file=paste(scripts_dir,"1_dataproc.r",sep="/"))

#2) Parametric model estimate
source(file=paste(scripts_dir,"2_parametriclm.r",sep="/"))

#3) GAM estimates
source(file=paste(scripts_dir,"3_gam.r",sep="/"))
