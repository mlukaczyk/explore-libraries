01\_explore-libraries\_comfy.R
================
madisonlukaczyk
Wed Jan 31 14:07:20 2018

Which libraries does R search for packages?

``` r
# try .libPaths(), .Library
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

Installed packages

``` r
## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
packages <- data.frame(installed.packages())
## remember to use View() or similar to inspect

## how many packages?
# 249
```

Exploring the packages

``` r
## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
tabulate(packages$LibPath)
```

    ## [1] 251

``` r
tabulate(packages$Priority)
```

    ## [1] 14 15

``` r
##   * what proportion need compilation?
# ie. these are packages that use C++ or something else that's not really R
prop.table(table(packages$NeedsCompilation))
```

    ## 
    ##        no       yes 
    ## 0.4979079 0.5020921

``` r
##   * how break down re: version of R they were built on
packages %>% group_by(Version) %>% count()
```

    ## # A tibble: 182 x 2
    ## # Groups:   Version [182]
    ##    Version     n
    ##     <fctr> <int>
    ##  1   0.0.2     1
    ##  2     0.1     3
    ##  3   0.1-1     2
    ##  4  0.1-11     1
    ##  5   0.1-2     1
    ##  6  0.1-24     1
    ##  7   0.1-3     1
    ##  8  0.1-42     1
    ##  9   0.1.0     2
    ## 10   0.1.1     4
    ## # ... with 172 more rows

``` r
## for tidyverts, here are some useful patterns
# data %>% count(var)
packages %>% count(Built)
```

    ## # A tibble: 4 x 2
    ##    Built     n
    ##   <fctr> <int>
    ## 1  3.4.0   114
    ## 2  3.4.1    43
    ## 3  3.4.2    36
    ## 4  3.4.3    58

``` r
# data %>% count(var1, var2)
packages %>% count(LibPath, Priority)
```

    ## # A tibble: 3 x 3
    ##                                                          LibPath
    ##                                                           <fctr>
    ## 1 /Library/Frameworks/R.framework/Versions/3.4/Resources/library
    ## 2 /Library/Frameworks/R.framework/Versions/3.4/Resources/library
    ## 3 /Library/Frameworks/R.framework/Versions/3.4/Resources/library
    ## # ... with 2 more variables: Priority <fctr>, n <int>

``` r
# data %>% count(var) %>% mutate(prop = n / sum(n))
```

Reflections

``` r
## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
# Not really - why does it matter? I download what I need

##   * how does the result of .libPaths() relate to the result of .Library?
# lib paths shows where the libraries for the current session live. Library shows where the packages live locally
```

Going further

``` r
## if you have time to do more ...

## is every package in .Library either base or recommended?
# both?

## study package naming style (all lower case, contains '.', etc

## use `fields` argument to installed.packages() to get more info and use it!
urls <- installed.packages(fields = "URL") %>% as_tibble() %>% 
  mutate(github=grepl("github", URL)) %>%
  group_by(github) %>% count()
```
