\name{purtest}
\alias{purtest}
\alias{print.purtest}
\alias{summary.purtest}
\alias{print.summary.purtest}

\title{Unit root tests for panel data}

\description{
\code{purtest} implements several testing procedures that have been proposed to test unit root hypotheses with panel data.
}

\usage{
purtest(object, data = NULL, index = NULL,
        test = c("levinlin", "ips", "madwu", "Pm" , "invnormal", "logit", "hadri"),
        exo = c("none", "intercept", "trend"),
        lags = c("SIC", "AIC", "Hall"), pmax = 10, Hcons = TRUE,
        q = NULL, dfcor = FALSE, fixedT = TRUE, \dots)
\method{print}{purtest}(x, \dots)
\method{summary}{purtest}(object, \dots)
\method{print}{summary.purtest}(x, \dots)
}

\arguments{
  \item{object, x}{Either a \code{"data.frame"} or a matrix containing the time series, a \code{"pseries"} object, a formula, or the name of a column of a \code{"data.frame"}, or a \code{"pdata.frame"} on which the test has to be computed; a \code{"purtest"} object for the print and summary methods,}
  \item{data}{a \code{"data.frame"} or a \code{"pdata.frame"} object,}
  \item{index}{the indexes,}
  \item{test}{the test to be computed: one of \code{"levinlin"} for Levin, Lin and Chu (2002), \code{"ips"} for Im, Pesaran and Shin (2003), \code{"madwu"} for Maddala and Wu (1999), \code{"Pm"} , \code{"invnormal"}, or \code{"logit"} for various tests as in Choi (2001), or \code{"hadri"} for Hadri (2000), see Details,}
  \item{exo}{the exogenous variables to introduce in the augmented Dickey--Fuller (ADF) regressions, one of: no exogenous variables (\code{"none"}), individual intercepts (\code{"intercept"}), or individual intercepts and trends (\code{"trend"}), but see Details,}
  \item{lags}{the number of lags to be used for the augmented Dickey-Fuller regressions: either an integer (the number of lags for all time series), a vector of integers (one for each time series), or a character string for an automatic computation of the number of lags, based on either the AIC (\code{"AIC"}), the SIC (\code{"SIC"}), or on the method by Hall (1994) (\code{"Hall"}),}
  \item{pmax}{maximum number of lags,}
  \item{Hcons}{logical, only relevant for \code{test = "hadri"}, indicating whether the heteroskedasticity-consistent test of Hadri (2000) should be computed,}
  \item{q}{the bandwidth for the estimation of the long-run variance,}
  \item{dfcor}{logical, indicating whether the standard deviation of the regressions is to be computed using a degrees-of-freedom correction,}
  \item{fixedT}{logical, indicating whether the different ADF regressions are to be computed using the same number of observations,}
  \item{\dots}{further arguments.}
}

\value{
An object of class \code{"purtest"}: a list with the elements \code{"statistic"} (a \code{"htest"} object), \code{"call"}, \code{"args"}, \code{"idres"} (containing results from the individual regressions), and \code{"adjval"} (containing the simulated means and variances needed to compute the statistic).
}

\details{
% TODO: in general, write more to the various tests
% TODO: mention which test is suitable for unbalanced panels (once the data pre-processing in purtest() is fixed to handle unbalanced data)
% TODO: mention which statistic of IPS (2003) we output: Ztbar or Wtbar? (it is not t-bar, the mean of t statistics)


All these tests except \code{"hadri"} are based on the estimation of augmented Dickey-Fuller (ADF) regressions for each time series.
A statistic is then computed using the t-statistics associated with the lagged variable. The Hadri residual-based LM statistic is 
the cross-sectional average of the individual KPSS statistics (Kwiatkowski/Phillips/Schmidt/Shin (1992)), standardized by their 
asymptotic mean and standard deviation.

Several Fisher-type tests that combine p-values from tests based on ADF regressions per individual are available:
\itemize{
  \item \code{"madwu"} is the inverse chi-squared test (Maddala and Wu (1999)), also called P test by Choi (2001)),
  \item \code{"Pm"} is the modified P test proposed by Choi (2001) for large N,
  \item \code{"invnormal"} is the inverse normal test by Choi (2001), and
  \item \code{"logit"} is the logit test by Choi (2001).
}
The individual p-values for the Fisher-type tests are approximated as described in MacKinnon (1994).

The kind of test to be computed can be specified in several ways, depending on how the data is handed over to the function:
\itemize{
  \item For the \code{formula}/\code{data} interface (if \code{data} is a \code{data.frame}, an additional \code{index} argument should be
  specified); the formula should be of the form: \code{y ~ 0}, \code{y ~ 1}, or \code{y ~ trend} for a test with no exogenous variables, 
  with an intercept, or with individual intercepts and time trend, respectively. The \code{exo} argument is ignored in this case.
  
  \item For the \code{data.frame}, \code{matrix}, and \code{pseries} interfaces: in these cases, the exogenous variables are specified 
  using the \code{exo} argument.
}

With the associated \code{summary} and \code{print} methods, additional information can be extracted/displayed (see also Value).
}

\seealso{
 \code{\link{cipstest}}
}

\references{

Choi, I. (2001). ``Unit root tests for panel data'', \emph{Journal of International Money and Finance}, \bold{20}(2), pp. 249--272.

Hadri K. (2000). ``Testing for Stationarity in Heterogeneous Panel Data'', \emph{The Econometrics Journal}, \bold{3}(2), pp. 148--161.

Hall A. (1994). ``Testing for a Unit Root in Time Series with Pretest Data-Based Model Selection'', \emph{Journal of Business & Economic Statistics}, \bold{12}(1), pp. 461--470.

Im K.S., Pesaran M.H. and Shin Y. (2003). ``Testing for Unit Roots in Heterogeneous Panels'', \emph{Journal of Econometrics}, \bold{115}(1), pp. 53--74.

Kwiatkowski D., Phillips P. C. B., Schmidt P. and Shin Y. (1992). ``Testing the null of stationarity against the alternative of a unit root:
How sure are we that economic time series have a unit root?'', \emph{Journal of Econometrics}, \bold{54}(1--3), pp. 159--178.

Levin A., Lin C.-F. and Chu C.-S.J. (2002). ``Unit Root Tests in Panel Data: Asymptotic and Finite-Sample Properties'', \emph{Journal of Econometrics}, \bold{108}(1), pp. 1--24.

MacKinnon, J.G. (1994). ``Approximate Asymptotic Distribution Functions for Unit-Root and Cointegration Tests'', \emph{Journal of Business & Economic Statistics}, \bold{12}(2), pp. 167--176.

Maddala G.S. and Wu S. (1999). ``A Comparative Study of Unit Root Tests with Panel Data and a New Simple Test'', \emph{Oxford Bulletin of Economics and Statistics}, \bold{61}, Supplement 1, pp. 631--652.
}

\examples{
data("Grunfeld", package = "plm")
y <- data.frame(split(Grunfeld$inv, Grunfeld$firm))

purtest(y, pmax = 4, exo = "intercept", test = "madwu")

## same via formula interface
purtest(inv ~ 1, data = Grunfeld, index = c("firm", "year"), pmax = 4, test = "madwu")
}

\author{Yves Croissant}

\keyword{htest}
