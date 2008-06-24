\name{plm}
\alias{plm}
\alias{print.panelmodel}
\alias{summary.plm}
\alias{print.summary.plm}
\title{Panel Data Estimators}
\description{
  Linear models for panel data estimated using the \code{lm} function on
  transformed data.
}
\usage{
plm(formula, data, subset, na.action, effect = "individual",
    model = "within", instruments = NULL, random.method = "swar",
    inst.method = "bvk", index = NULL, pvar = TRUE, ...)
\method{summary}{plm}(object, ...)
\method{print}{summary.plm}(x, digits = max(3, getOption("digits") - 2),
    width = getOption("width"), ...)


}

\arguments{
  \item{formula}{a symbolic description for the model to be estimated,}
  \item{object,x}{an object of class \code{"plm"},}
  \item{data}{a \code{data.frame},}
  \item{subset}{see \code{\link{lm}},}
  \item{na.action}{see \code{\link{lm}},}

  \item{effect}{the effects introduced in the model, one of
  \code{"individual"}, \code{"time"} or \code{"twoways"},}

  \item{model}{one of \code{"pooling"}, \code{"within"},
    \code{"between"}, \code{"random",} \code{"fd"} and \code{"ht"},}

  \item{instruments}{a one--sided formula containing instrumental
    variables,}

  \item{random.method}{method of estimation for the variance components
    in the random effect model, one of \code{"swar"} (the default
    value), \code{"amemiya"}, \code{"walhus"} and \code{"nerlove"},}

  \item{inst.method}{the instrumental variable transformation : one of
    \code{"bvk"} and \code{"baltagi"},}

  \item{index}{the indexes,}
  \item{pvar}{if \code{TRUE}, the \code{pvar} function is called,}
  \item{digits}{digits,}
  \item{width}{the maximum length of the lines in the print output,}
  \item{\dots}{further arguments.}
}

\details{
  \code{plm} is a general function for the estimation of linear
  panel models. It supports the following estimation methods:
  pooled OLS (\code{model="pooling"}), fixed effects (\code{"within"}),
  random effects (\code{"random"}), first--difference (\code{"fd}) and
  between (\code{"between"}). It supports unbalanced panels and two--ways
  effects (although not with all methods).

  For random effect models, 4 estimators of the transformation
  parameter are available : \code{swar} (Swamy and Arora),
  \code{amemiya}, \code{walhus} (Wallace and Hussain) and \code{nerlove}.

  Instrumental variables estimation is obtained using different
  syntaxes. If for example, the model is \code{y~x1+x2+x3}, \code{x1},
  \code{x2} are endogenous and \code{z1}, \code{z2} are external
  instruments, the model can be estimated with :

  \itemize{
    \item \code{formula=y~x1+x2+x3, instruments=~x3+z1+z2},
    \item \code{formula=y~x1+x2+x3, instruments=~.-x1-x2+z1+z2},
    \item \code{formula=y~x1+x2+x3 | x3+z1+z2},
    \item \code{formula=y~x1+x2+x3 | .-x1-x2+z1+z2}.
  }

  Balestra and Varadharajan--Krishnakumar's or Baltagi's method is used if
  \code{inst.method="bvk"} or if  \code{inst.method="baltagi"}.
  
  The Hausman and Taylor estimator is computed if \code{model="ht"}.
  
}

\value{
  
  an object of class \code{c("plm","panelmodel")}.

  A \code{"plm"} object  has the following elements :
  
  %  \describe{
  \item{coefficients}{the vector of coefficients,}
  \item{residuals}{the vector of residuals,}
  \item{fitted.values}{the vector of fitted.values,}
  \item{vcov}{the covariance matrix of the coefficients,}
  \item{df.residual}{degrees of freedom of the residuals,}
  \item{model}{a data.frame containing the variables used for the
    estimation,}
  \item{call}{the call,}
  \item{FE}{the fixed effects (only for within models),}
  \item{alpha}{the overall intercept (only for within models),}
  \item{theta}{the parameter of transformation (only for random effect
    models),}
  \item{sigma2}{the variance of the different elements of the error
    (only for random effect models),}
  \item{indexes}{a list containing the two index vectors (id and time).}
    %  }
    
    It has \code{print}, \code{summary} and \code{print.summary} methods.

}


\author{Yves Croissant}

\references{
  Amemiyia, T. (1971) The estimation of the variances in a
  variance--components model, \emph{International Economic Review}, \bold{12},
  pp.1--13.

  Balestra, P. and Varadharajan--Krishnakumar, J. (1987) Full
  information estimations of a system of simultaneous equations with
  error components structure, \emph{Econometric Theory}, \bold{3}, pp.223--246.
  
  Baltagi, B.H. (1981) Simultaneous equations with error components,
  \emph{Journal of econometrics}, \bold{17}, pp.21--49.
  
  Baltagi, B.H. (2001) \emph{Econometric Analysis of Panel Data}. John
  Wiley and sons. ltd.

  Hausman, J.A. and  Taylor W.E. (1981) Panel data and unobservable
  individual effects, \emph{Econometrica}, \bold{49}, pp.1377--1398.
  
  Nerlove, M. (1971) Further evidence on the estimation of dynamic
  economic relations from a time--series of cross--sections,
  \emph{Econometrica}, \bold{39}, pp.359--382.

  Swamy, P.A.V.B. and  Arora, S.S. (1972) The exact finite sample
  properties of the estimators of coefficients in the error components
  regression models, \emph{Econometrica}, \bold{40}, pp.261--275.

  Wallace, T.D. and  Hussain, A. (1969) The use of error components
  models in combining cross section with time series data,
  \emph{Econometrica}, \bold{37}(1), pp.55--72.
}
\examples{
data("Produc", package="Ecdat")
zz <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc, index=c("state","year"))
summary(zz)
}
\keyword{regression}