#'---
#' output: github_document
#'---

library(dplyr)
library(janitor)

#' Which libraries does R search for packages?

# try .libPaths(), .Library

#' Installed packages
packages <- data.frame(installed.packages())
packages %>% group_by(Package, Version)
#master.pack <- as.character(packages$Package)
#write.csv(master.pack, "master_pack.csv", row.names = F)
master.pack <- data.frame(read.csv('./master_pack.csv'), stringsAsFactors = F) 
master.pack <- as.character(master.pack$x)

new.packages <- master.pack[!(master.pack %in% installed.packages()[,"Package"])]
((new.packages))

if(length(new.packages)) install.packages(new.packages)


devtools::session_info()
