#' Which libraries does R search for packages?

# try .libPaths(), .Library
library(dplyr)

#' Installed packages

## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
packages <- data.frame(installed.packages())
## remember to use View() or similar to inspect

## how many packages?
# 249

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
tabulate(packages$LibPath)
tabulate(packages$Priority)

##   * what proportion need compilation?
# ie. these are packages that use C++ or something else that's not really R
prop.table(table(packages$NeedsCompilation))

##   * how break down re: version of R they were built on
packages %>% group_by(Version) %>% count()

## for tidyverts, here are some useful patterns
# data %>% count(var)
packages %>% count(Built)
# data %>% count(var1, var2)
packages %>% count(LibPath, Priority)

# data %>% count(var) %>% mutate(prop = n / sum(n))

#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
# Not really - why does it matter? I download what I need

##   * how does the result of .libPaths() relate to the result of .Library?
# lib paths shows where the libraries for the current session live. Library shows where the packages live locally

#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
# both?

## study package naming style (all lower case, contains '.', etc

## use `fields` argument to installed.packages() to get more info and use it!
urls <- installed.packages(fields = "URL") %>% as_tibble() %>% 
  mutate(github=grepl("github", URL)) %>%
  group_by(github) %>% count()
