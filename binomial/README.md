## Overview

`"binomial"` is a minimal [R](http://www.r-project.org/) package that
provides functions to simulate the binomial distribution.

  - `bin_choose()` performs the 'choose' operation (i.e. n choose k)
  - `bin_probability()` computes the probability of k successes in n trials, with each success of probability p.
  - `bin_distribution()` outputs a distribution of a binomial variable
  - `plot.binvar()` plots the distribution in a barplot
  - `bin_cumulative()` outputs a cumulative distribution (<= k successes) of a binomial variable
  - `plot.bincum()` plots the distribution in a lineplot
  - `summary()` method for a `"binvar"` object.
  - `bin_mean()` method calculates mean of variable given trials and prob
  - `bin_variance()` method calculates variance of variable given trials and prob
  - `bin_mode()` method calculates mode of variable given trials and prob
  - `bin_skewness()` method calculates skewness of variable given trials and prob
  - `bin_kurtosis()` method calculates kurtosis of variable given trials and prob

## Motivation

This package has been developed to practice creating an R package.

## Installation

Install the development version from GitHub via the package
`"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-kevsters/binomial")

# install "cointoss" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-kevsters/binomial", build_vignettes = TRUE)
```

## Usage

bin_choose(5, 2)

bin_probability(success = 0:2, trials = 5, prob = 0.5)

dis1 = bin_distribution(trials = 5, prob = 0.5) 
plot.binvar(dis1)

dis2 = bin_cumulative(trials = 5, prob = 0.5)
plot.bincum(dis2)

bin1 = bin_variable(10, 0.3)
binsum1 = summary(bin1)
binsum1

bin_mean(10, 0.3)
bin_variance(10, 0.3)
bin_mode(10, 0.3)
bin_skewness(10, 0.3)
bin_kurtosis(10, 0.3)
