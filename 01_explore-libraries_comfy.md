01\_explore-libraries\_comfy.R
================
madisonlukaczyk
Wed Jan 31 15:55:38 2018

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Which libraries does R search for packages?

``` r
# try .libPaths(), .Library
```

Installed packages

``` r
packages <- data.frame(installed.packages())
packages %>% group_by(Package, Version)
```

    ## # A tibble: 257 x 16
    ## # Groups:   Package, Version [257]
    ##            Package
    ##  *          <fctr>
    ##  1           abind
    ##  2         acepack
    ##  3      addinslist
    ##  4      assertthat
    ##  5       backports
    ##  6            base
    ##  7       base64enc
    ##  8 BayesianNetwork
    ##  9         bestglm
    ## 10              BH
    ## # ... with 247 more rows, and 15 more variables: LibPath <fctr>,
    ## #   Version <fctr>, Priority <fctr>, Depends <fctr>, Imports <fctr>,
    ## #   LinkingTo <fctr>, Suggests <fctr>, Enhances <fctr>, License <fctr>,
    ## #   License_is_FOSS <fctr>, License_restricts_use <fctr>, OS_type <fctr>,
    ## #   MD5sum <fctr>, NeedsCompilation <fctr>, Built <fctr>

``` r
#master.pack <- as.character(packages$Package)
#write.csv(master.pack, "master_pack.csv", row.names = F)
master.pack <- data.frame(read.csv('./master_pack.csv'), stringsAsFactors = F) 
master.pack <- as.character(master.pack$x)

new.packages <- master.pack[!(master.pack %in% installed.packages()[,"Package"])]
((new.packages))
```

    ## character(0)

``` r
if(length(new.packages)) install.packages(new.packages)


devtools::session_info()
```

    ## Session info -------------------------------------------------------------

    ##  setting  value                       
    ##  version  R version 3.4.3 (2017-11-30)
    ##  system   x86_64, darwin15.6.0        
    ##  ui       X11                         
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2018-01-31

    ## Packages -----------------------------------------------------------------

    ##  package    * version date       source        
    ##  assertthat   0.2.0   2017-04-11 CRAN (R 3.4.0)
    ##  backports    1.1.2   2017-12-13 CRAN (R 3.4.3)
    ##  base       * 3.4.3   2017-12-07 local         
    ##  bindr        0.1     2016-11-13 CRAN (R 3.4.0)
    ##  bindrcpp     0.2     2017-06-17 CRAN (R 3.4.0)
    ##  colorspace   1.3-2   2016-12-14 CRAN (R 3.4.0)
    ##  compiler     3.4.3   2017-12-07 local         
    ##  datasets   * 3.4.3   2017-12-07 local         
    ##  devtools     1.13.4  2017-11-09 CRAN (R 3.4.2)
    ##  digest       0.6.13  2017-12-14 CRAN (R 3.4.3)
    ##  dplyr      * 0.7.4   2017-09-28 CRAN (R 3.4.2)
    ##  evaluate     0.10.1  2017-06-24 CRAN (R 3.4.1)
    ##  ggplot2    * 2.2.1   2016-12-30 CRAN (R 3.4.0)
    ##  glue         1.2.0   2017-10-29 CRAN (R 3.4.2)
    ##  graphics   * 3.4.3   2017-12-07 local         
    ##  grDevices  * 3.4.3   2017-12-07 local         
    ##  grid         3.4.3   2017-12-07 local         
    ##  gtable       0.2.0   2016-02-26 CRAN (R 3.4.0)
    ##  htmltools    0.3.6   2017-04-28 CRAN (R 3.4.0)
    ##  knitr        1.17    2017-08-10 CRAN (R 3.4.1)
    ##  lazyeval     0.2.1   2017-10-29 CRAN (R 3.4.2)
    ##  magrittr     1.5     2014-11-22 CRAN (R 3.4.0)
    ##  memoise      1.1.0   2017-04-21 CRAN (R 3.4.0)
    ##  methods    * 3.4.3   2017-12-07 local         
    ##  munsell      0.4.3   2016-02-13 CRAN (R 3.4.0)
    ##  pkgconfig    2.0.1   2017-03-21 CRAN (R 3.4.0)
    ##  plyr         1.8.4   2016-06-08 CRAN (R 3.4.0)
    ##  R6           2.2.2   2017-06-17 CRAN (R 3.4.0)
    ##  Rcpp         0.12.14 2017-11-23 CRAN (R 3.4.3)
    ##  reshape2   * 1.4.3   2017-12-11 CRAN (R 3.4.3)
    ##  rlang        0.1.4   2017-11-05 CRAN (R 3.4.2)
    ##  rmarkdown    1.8     2017-11-17 CRAN (R 3.4.2)
    ##  rprojroot    1.3-1   2017-12-18 CRAN (R 3.4.1)
    ##  scales       0.5.0   2017-08-24 cran (@0.5.0) 
    ##  stats      * 3.4.3   2017-12-07 local         
    ##  stringi      1.1.6   2017-11-17 CRAN (R 3.4.2)
    ##  stringr      1.2.0   2017-02-18 CRAN (R 3.4.0)
    ##  tibble       1.3.4   2017-08-22 cran (@1.3.4) 
    ##  tools        3.4.3   2017-12-07 local         
    ##  utils      * 3.4.3   2017-12-07 local         
    ##  withr        2.1.1   2017-12-19 CRAN (R 3.4.3)
    ##  yaml         2.1.16  2017-12-12 CRAN (R 3.4.3)
