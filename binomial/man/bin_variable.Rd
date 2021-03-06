% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binom.R
\name{bin_variable}
\alias{bin_variable}
\title{Bin_Variable}
\usage{
bin_variable(trials, prob)
}
\arguments{
\item{trials}{an integer or vector of numerics - number of trials}

\item{prob}{a numeric value between 0 and 1}
}
\value{
a "binvar" object, which is a named list
}
\description{
takes in trials and prob and outputs a named list describing those values
}
\examples{
# default
bin1 <- bin_variable(trials = 10, prob = 0.3)

}
