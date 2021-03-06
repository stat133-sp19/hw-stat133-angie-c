% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_cumulative}
\alias{bin_cumulative}
\title{bin cumulative distribution}
\usage{
bin_cumulative(trials, prob)
}
\arguments{
\item{trials}{number of trials}

\item{prob}{probability value}
}
\value{
data.frame with two classes: c("bincum", "data.frame")
}
\description{
creates a data frame of a binomial cumulative distribution
}
\examples{
bin_cumulative(trials = 5, prob = 0.5)
}
