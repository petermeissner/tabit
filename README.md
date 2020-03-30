
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Simple Tabulation Made Simple

**Status**

*lines of R code:* 150, *lines of test code:* 117

[![repo
status](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
<a href="https://travis-ci.org/petermeissner/tabit">
<img src="https://api.travis-ci.org/petermeissner/tabit.svg?branch=master">
<a/> [![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/petermeissner/tabit?branch=master&svg=true)](https://ci.appveyor.com/project/petermeissner/ical)
<a href="https://cran.r-project.org/package=tabit">
<img src="http://www.r-pkg.org/badges/version/tabit"> </a>
<a href="https://codecov.io/gh/petermeissner/tabit">
<img src="https://codecov.io/gh/petermeissner/tabit/branch/master/graph/badge.svg" alt="Codecov" />
</a> <img src="http://cranlogs.r-pkg.org/badges/grand-total/tabit">
<img src="http://cranlogs.r-pkg.org/badges/tabit">

**Development version**

0.2.1 - 2020-03-30 / 20:12:13

**Description**

Simple tabulation should be dead simple. This package is an opinionated
approach to easy tabulations while also providing exact numbers and
allowing for re-usability. This is achieved by providing tabulations as
data.frames with columns for values, optional variable names, frequency
counts including and excluding NAs and percentages for counts including
and excluding NAs. Also values are automatically sorted by in decreasing
order of frequency counts to allow for fast skimming of the most
important information.

**License**

MIT + file LICENSE <br>Peter Meissner \[aut, cre\]

## Installation

You can install the released version of tabit from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tabit")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("petermeissner/tabit")
```

## Example

``` r
# load package
library(tabit)
```

**simple vectors**

``` r
# simple tabulation
tabit(mtcars$cyl)
##   .variable .value .count  .pct .pct_incl_na
## 3         .      8     14 43.75        43.75
## 1         .      4     11 34.38        34.38
## 2         .      6      7 21.88        21.88
## 4         .     NA      0    NA         0.00
```

**simple data.frames**

``` r
# can we do this with data.frames
tabit(mtcars[, c("cyl", "am")])
##   cyl am .count  .pct .pct_incl_na
## 3   8  0     12 37.50        37.50
## 4   4  1      8 25.00        25.00
## 2   6  0      4 12.50        12.50
## 1   4  0      3  9.38         9.38
## 5   6  1      3  9.38         9.38
## 6   8  1      2  6.25         6.25
```

**simple tibbles**

``` r
# what about this tibble thing?
suppressPackageStartupMessages({
  library(dplyr)
})
## Warning: package 'dplyr' was built under R version 3.6.3
mtcars %>% 
  select(cyl, am) %>% 
  tabit()
##   cyl am .count  .pct .pct_incl_na
## 3   8  0     12 37.50        37.50
## 4   4  1      8 25.00        25.00
## 2   6  0      4 12.50        12.50
## 1   4  0      3  9.38         9.38
## 5   6  1      3  9.38         9.38
## 6   8  1      2  6.25         6.25
```

**grouped tibbles**

``` r
# ... and grouped tibbles?
mtcars %>% 
  group_by(cyl, am) %>% 
  tabit()
##   cyl am .count  .pct .pct_incl_na
## 3   8  0     12 37.50        37.50
## 4   4  1      8 25.00        25.00
## 2   6  0      4 12.50        12.50
## 1   4  0      3  9.38         9.38
## 5   6  1      3  9.38         9.38
## 6   8  1      2  6.25         6.25
```

**too much magic?**

``` r
# use tabit_1() for vector usage
tabit_1(letters[1:4])
##   .variable .value .count .pct .pct_incl_na
## 1         .      a      1   25           25
## 2         .      b      1   25           25
## 3         .      c      1   25           25
## 4         .      d      1   25           25
## 5         .     NA      0   NA            0

# use tabit_x for data.frames and tibbles
tabit_x(mtcars[, c("cyl", "am")])
##   cyl am .count  .pct .pct_incl_na
## 3   8  0     12 37.50        37.50
## 4   4  1      8 25.00        25.00
## 2   6  0      4 12.50        12.50
## 1   4  0      3  9.38         9.38
## 5   6  1      3  9.38         9.38
## 6   8  1      2  6.25         6.25
```
