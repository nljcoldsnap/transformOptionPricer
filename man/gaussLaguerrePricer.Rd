% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gaussLaguerrePricerBS.R
\name{gaussLaguerrePricer}
\alias{gaussLaguerrePricer}
\title{Laguerre quadrature pricing.}
\usage{
gaussLaguerrePricer(strikeMat, mkt, alpha = 0, N = 64, sigma.ref = NULL,
  N.factors = 3, charFun, preCalc = NULL, ...)
}
\arguments{
\item{strikeMat}{array of size \code{TxKxS} of relative log-strikes}

\item{mkt}{data.frame with \code{T} rows and fields: r -- risk-free rate, q -- dividend yield, t -- option maturity.}

\item{alpha}{parameter of the laguerre quadrature.}

\item{N}{number of points of integration.}

\item{sigma.ref}{variance (volatility squared) value for the reference characteristic function, length \code{S}. If not provided, \code{...} will be checked for existence of a state matrix and \col{rowSums} of variance states will be taken.}

\item{N.factors}{integer, number of stochastic volatility factors, argument for \code{charFun}. If your \code{charFun} doesn't accept such an argument, for example you're pricing in the Black-Scholes model, use \code{N.factors = 0}.}

\item{preCalc}{optional a list containing preCalculated values of the characteristic function, and the quadrature parameters (useful if derivatives are reevaluated many times for different states, but the same parameter)}

\item{...}{arguments to charFun required for pricing (state variables, parameters, etc.)}
}
\value{
list of arrays of size \code{T x K x S} with relative prices of call options, put options, out of the money options.
}
\description{
Calculate option prices using a Laguerre quadrature of the difference between a reference characteristic function (Black-Scholes for high volatility) and user-defined characteristic function. Only European call and put options.
}
\details{
In extensive tests this pricer yields results comparable to the Fourier-cosine series pricer, with fewer characteristic function evaluations. Care should be taken at very high values of variance factors.
}
