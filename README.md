
<!-- README.md is generated from README.Rmd. Please edit that file -->

## simple Tabulation Made Simple

**Status**

*lines of R code:* 54, *lines of test code:* 0

[![repo
status](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
<a href="https://travis-ci.org/petermeissner/tabit">
<img src="https://api.travis-ci.org/petermeissner/tabit.svg?branch=master">
<a/> [![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/petermeissner/tabit?branch=master&svg=true)](https://ci.appveyor.com/project/petermeissner/ical)
<a href="https://cran.r-project.org/package=tabit">
<img src="http://www.r-pkg.org/badges/version/tabit"> </a><!--
<a href="https://codecov.io/gh/petermeissner/tabit">
  <img src="https://codecov.io/gh/petermeissner/tabit/branch/master/graph/badge.svg" alt="Codecov" />
</a>
--><img src="http://cranlogs.r-pkg.org/badges/grand-total/tabit">
<img src="http://cranlogs.r-pkg.org/badges/tabit">

**Development version**

0.1.0 - 2019-09-17 / 12:40:18

**Description**

Simple tabulation should be dead simple. This package is dedicated to an
easy way to get tabulations while also providing exact numbers and
allowing for re-usability. This is achieved by providing tabulations as
data.frames with columns for values, optional variable names, frequency
counts including and excluding NAs and percentages for counts including
and excluding NAs.

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
library(tabit)
ti_tab1(mtcars$cyl)
##   value count   pct pct_all
## 3     8    14 43.75   43.75
## 1     4    11 34.38   34.38
## 2     6     7 21.88   21.88
## 4  <NA>     0    NA    0.00

ti_tab1(mtcars[, c("cyl", "am")])
##   name value count   pct pct_all
## 1  cyl     8    14 43.75   43.75
## 2  cyl     4    11 34.38   34.38
## 3  cyl     6     7 21.88   21.88
## 4  cyl  <NA>     0    NA    0.00
## 5   am     0    19 59.38   59.38
## 6   am     1    13 40.62   40.62
## 7   am  <NA>     0    NA    0.00
```
