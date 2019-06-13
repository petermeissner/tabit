
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tabit

<!-- badges: start -->

<!-- badges: end -->

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
tab1(mtcars$cyl)
#>   value count   pct pct_all
#> 3     8    14 43.75   43.75
#> 1     4    11 34.38   34.38
#> 2     6     7 21.88   21.88
#> 4  <NA>     0    NA    0.00

tab1(mtcars)
#>     name value count   pct pct_all
#> 1    mpg  10.4     2  6.25    6.25
#> 2    mpg  15.2     2  6.25    6.25
#> 3    mpg  19.2     2  6.25    6.25
#> 4    mpg    21     2  6.25    6.25
#> 5    mpg  21.4     2  6.25    6.25
#> 6    mpg  22.8     2  6.25    6.25
#> 7    mpg  30.4     2  6.25    6.25
#> 8    mpg  13.3     1  3.12    3.12
#> 9    mpg  14.3     1  3.12    3.12
#> 10   mpg  14.7     1  3.12    3.12
#> 11   mpg    15     1  3.12    3.12
#> 12   mpg  15.5     1  3.12    3.12
#> 13   mpg  15.8     1  3.12    3.12
#> 14   mpg  16.4     1  3.12    3.12
#> 15   mpg  17.3     1  3.12    3.12
#> 16   mpg  17.8     1  3.12    3.12
#> 17   mpg  18.1     1  3.12    3.12
#> 18   mpg  18.7     1  3.12    3.12
#> 19   mpg  19.7     1  3.12    3.12
#> 20   mpg  21.5     1  3.12    3.12
#> 21   mpg  24.4     1  3.12    3.12
#> 22   mpg    26     1  3.12    3.12
#> 23   mpg  27.3     1  3.12    3.12
#> 24   mpg  32.4     1  3.12    3.12
#> 25   mpg  33.9     1  3.12    3.12
#> 26   mpg  <NA>     0    NA    0.00
#> 27   cyl     8    14 43.75   43.75
#> 28   cyl     4    11 34.38   34.38
#> 29   cyl     6     7 21.88   21.88
#> 30   cyl  <NA>     0    NA    0.00
#> 31  disp 275.8     3  9.38    9.38
#> 32  disp   160     2  6.25    6.25
#> 33  disp 167.6     2  6.25    6.25
#> 34  disp   360     2  6.25    6.25
#> 35  disp  71.1     1  3.12    3.12
#> 36  disp  75.7     1  3.12    3.12
#> 37  disp  78.7     1  3.12    3.12
#> 38  disp    79     1  3.12    3.12
#> 39  disp  95.1     1  3.12    3.12
#> 40  disp   108     1  3.12    3.12
#> 41  disp 120.1     1  3.12    3.12
#> 42  disp 120.3     1  3.12    3.12
#> 43  disp   121     1  3.12    3.12
#> 44  disp 140.8     1  3.12    3.12
#> 45  disp   145     1  3.12    3.12
#> 46  disp 146.7     1  3.12    3.12
#> 47  disp   225     1  3.12    3.12
#> 48  disp   258     1  3.12    3.12
#> 49  disp   301     1  3.12    3.12
#> 50  disp   304     1  3.12    3.12
#> 51  disp   318     1  3.12    3.12
#> 52  disp   350     1  3.12    3.12
#> 53  disp   351     1  3.12    3.12
#> 54  disp   400     1  3.12    3.12
#> 55  disp   440     1  3.12    3.12
#> 56  disp   460     1  3.12    3.12
#> 57  disp   472     1  3.12    3.12
#> 58  disp  <NA>     0    NA    0.00
#> 59    hp   110     3  9.38    9.38
#> 60    hp   175     3  9.38    9.38
#> 61    hp   180     3  9.38    9.38
#> 62    hp    66     2  6.25    6.25
#> 63    hp   123     2  6.25    6.25
#> 64    hp   150     2  6.25    6.25
#> 65    hp   245     2  6.25    6.25
#> 66    hp    52     1  3.12    3.12
#> 67    hp    62     1  3.12    3.12
#> 68    hp    65     1  3.12    3.12
#> 69    hp    91     1  3.12    3.12
#> 70    hp    93     1  3.12    3.12
#> 71    hp    95     1  3.12    3.12
#> 72    hp    97     1  3.12    3.12
#> 73    hp   105     1  3.12    3.12
#> 74    hp   109     1  3.12    3.12
#> 75    hp   113     1  3.12    3.12
#> 76    hp   205     1  3.12    3.12
#> 77    hp   215     1  3.12    3.12
#> 78    hp   230     1  3.12    3.12
#> 79    hp   264     1  3.12    3.12
#> 80    hp   335     1  3.12    3.12
#> 81    hp  <NA>     0    NA    0.00
#> 82  drat  3.07     3  9.38    9.38
#> 83  drat  3.92     3  9.38    9.38
#> 84  drat  2.76     2  6.25    6.25
#> 85  drat  3.08     2  6.25    6.25
#> 86  drat  3.15     2  6.25    6.25
#> 87  drat   3.9     2  6.25    6.25
#> 88  drat  4.08     2  6.25    6.25
#> 89  drat  4.22     2  6.25    6.25
#> 90  drat  2.93     1  3.12    3.12
#> 91  drat     3     1  3.12    3.12
#> 92  drat  3.21     1  3.12    3.12
#> 93  drat  3.23     1  3.12    3.12
#> 94  drat  3.54     1  3.12    3.12
#> 95  drat  3.62     1  3.12    3.12
#> 96  drat  3.69     1  3.12    3.12
#> 97  drat   3.7     1  3.12    3.12
#> 98  drat  3.73     1  3.12    3.12
#> 99  drat  3.77     1  3.12    3.12
#> 100 drat  3.85     1  3.12    3.12
#> 101 drat  4.11     1  3.12    3.12
#> 102 drat  4.43     1  3.12    3.12
#> 103 drat  4.93     1  3.12    3.12
#> 104 drat  <NA>     0    NA    0.00
#> 105   wt  3.44     3  9.38    9.38
#> 106   wt  3.57     2  6.25    6.25
#> 107   wt 1.513     1  3.12    3.12
#> 108   wt 1.615     1  3.12    3.12
#> 109   wt 1.835     1  3.12    3.12
#> 110   wt 1.935     1  3.12    3.12
#> 111   wt  2.14     1  3.12    3.12
#> 112   wt   2.2     1  3.12    3.12
#> 113   wt  2.32     1  3.12    3.12
#> 114   wt 2.465     1  3.12    3.12
#> 115   wt  2.62     1  3.12    3.12
#> 116   wt  2.77     1  3.12    3.12
#> 117   wt  2.78     1  3.12    3.12
#> 118   wt 2.875     1  3.12    3.12
#> 119   wt  3.15     1  3.12    3.12
#> 120   wt  3.17     1  3.12    3.12
#> 121   wt  3.19     1  3.12    3.12
#> 122   wt 3.215     1  3.12    3.12
#> 123   wt 3.435     1  3.12    3.12
#> 124   wt  3.46     1  3.12    3.12
#> 125   wt  3.52     1  3.12    3.12
#> 126   wt  3.73     1  3.12    3.12
#> 127   wt  3.78     1  3.12    3.12
#> 128   wt  3.84     1  3.12    3.12
#> 129   wt 3.845     1  3.12    3.12
#> 130   wt  4.07     1  3.12    3.12
#> 131   wt  5.25     1  3.12    3.12
#> 132   wt 5.345     1  3.12    3.12
#> 133   wt 5.424     1  3.12    3.12
#> 134   wt  <NA>     0    NA    0.00
#> 135 qsec 17.02     2  6.25    6.25
#> 136 qsec  18.9     2  6.25    6.25
#> 137 qsec  14.5     1  3.12    3.12
#> 138 qsec  14.6     1  3.12    3.12
#> 139 qsec 15.41     1  3.12    3.12
#> 140 qsec  15.5     1  3.12    3.12
#> 141 qsec 15.84     1  3.12    3.12
#> 142 qsec 16.46     1  3.12    3.12
#> 143 qsec  16.7     1  3.12    3.12
#> 144 qsec 16.87     1  3.12    3.12
#> 145 qsec  16.9     1  3.12    3.12
#> 146 qsec 17.05     1  3.12    3.12
#> 147 qsec  17.3     1  3.12    3.12
#> 148 qsec  17.4     1  3.12    3.12
#> 149 qsec 17.42     1  3.12    3.12
#> 150 qsec  17.6     1  3.12    3.12
#> 151 qsec 17.82     1  3.12    3.12
#> 152 qsec 17.98     1  3.12    3.12
#> 153 qsec    18     1  3.12    3.12
#> 154 qsec  18.3     1  3.12    3.12
#> 155 qsec 18.52     1  3.12    3.12
#> 156 qsec  18.6     1  3.12    3.12
#> 157 qsec 18.61     1  3.12    3.12
#> 158 qsec 19.44     1  3.12    3.12
#> 159 qsec 19.47     1  3.12    3.12
#> 160 qsec  19.9     1  3.12    3.12
#> 161 qsec    20     1  3.12    3.12
#> 162 qsec 20.01     1  3.12    3.12
#> 163 qsec 20.22     1  3.12    3.12
#> 164 qsec  22.9     1  3.12    3.12
#> 165 qsec  <NA>     0    NA    0.00
#> 166   vs     0    18 56.25   56.25
#> 167   vs     1    14 43.75   43.75
#> 168   vs  <NA>     0    NA    0.00
#> 169   am     0    19 59.38   59.38
#> 170   am     1    13 40.62   40.62
#> 171   am  <NA>     0    NA    0.00
#> 172 gear     3    15 46.88   46.88
#> 173 gear     4    12 37.50   37.50
#> 174 gear     5     5 15.62   15.62
#> 175 gear  <NA>     0    NA    0.00
#> 176 carb     2    10 31.25   31.25
#> 177 carb     4    10 31.25   31.25
#> 178 carb     1     7 21.88   21.88
#> 179 carb     3     3  9.38    9.38
#> 180 carb     6     1  3.12    3.12
#> 181 carb     8     1  3.12    3.12
#> 182 carb  <NA>     0    NA    0.00
```
