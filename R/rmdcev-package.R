#' rmdcev: Estimating and simulating multiple discrete-continuous extreme value (MDCEV) demand models
#'
#'
#' @description The rmdcev R package estimates and simulates multiple discrete-continuous extreme value (MDCEV)
#' demand models (also known as Kuhn-Tucker demand models) with observed and unobserved individual heterogneity (Bhat (2008) <doi.org/10.1016/j.trb.2007.06.002>).
#' Fixed parameter, latent class, and random parameter models can be estimated. These models are estimated using
#' maximum likelihood or Bayesian estimation techniques and are implemented in Stan, which is a
#' C++ package for performing full Bayesian inference (see Stan Development Team (2018) <http://mc-stan.org>).
#' The package also includes demand simulation (Pinjari and Bhat (2011) <https://repositories.lib.utexas.edu/handle/2152/23880>)
#' and welfare simulation (Lloyd-Smith (2018) <doi.org/10.1016/j.jocm.2017.12.002>).
#'
#' @docType package
#' @name rmdcev
#' @aliases rmdcev
#' @useDynLib rmdcev, .registration = TRUE
#' @import methods
#' @import Rcpp
#' @import rstantools
#' @importFrom rstan sampling
#'
#' @author Patrick Lloyd-Smith \email{patrick.lloydsmith@usask.ca}
#'
#' @references
#' Bhat, CR (2008). The multiple discrete-continuous extreme value (MDCEV) model: Role of utility function parameters, identification considerations, and model extensions. Transportation Research Part B: Methodological, 42(3): 274-303.\href{https://doi.org/10.1016/j.trb.2007.06.002}{(link)}
#' Lloyd-Smith, P (2018). A new approach to calculating welfare measures in Kuhn-Tucker demand models. Journal of Choice Modeling 26:19–27. \href{https://doi.org/10.1016/j.jocm.2017.12.002}{(link)}
#' Pinjari, AR, Bhat, CR (2011). Computationally Efficient Forecasting Procedures for Kuhn-Tucker Consumer Demand Model Systems: Application to Residential Energy Consumption Analysis. Department of Civil and Environmental Engineering, University of South Florida. \href{https://repositories.lib.utexas.edu/handle/2152/23880}{(link)}
#' Stan Development Team (2018). RStan: the R interface to Stan. R package version 2.18.2. \href{http://mc-stan.org}{(link)}
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")
	utils::globalVariables(c(".", "quant", "lp__", "good", "data",
							"task", "individual", "CalcWTP_rng",
							"CalcMarshallianDemand_rng", "CalcWTPPriceOnly_rng", "CalcMarshallianDemandPriceOnly_rng",
							"CalcmdemandOne_rng", "parms", "sim_id", "value", "policy", "std_dev",
							"names_b", "parm_num", "n_eff", "Rhat",
							"Estimate", "Std.err", "z.stat", "ci_lo95", "ci_hi95"))