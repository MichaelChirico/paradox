% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ParamInt.R
\name{ParamInt}
\alias{ParamInt}
\title{Integer Parameter}
\description{
A \link{Param} to describe integer parameters.
}
\section{Methods}{

See \link{Param}.
}

\examples{
ParamInt$new("count", lower = 0, upper = 10, default = 1)
}
\seealso{
Other Params: 
\code{\link{ParamDbl}},
\code{\link{ParamFct}},
\code{\link{ParamLgl}},
\code{\link{ParamUty}},
\code{\link{Param}}
}
\concept{Params}
\section{Super class}{
\code{\link[paradox:Param]{paradox::Param}} -> \code{ParamInt}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{lower}}{(\code{numeric(1)})\cr
Lower bound.
Always \code{NA} for \link{ParamFct}, \link{ParamLgl} and \link{ParamUty}.}

\item{\code{upper}}{(\code{numeric(1)})\cr
Upper bound.
Always \code{NA} for \link{ParamFct}, \link{ParamLgl} and \link{ParamUty}.}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{levels}}{(\code{character()} | \code{NULL})\cr
Set of allowed levels.
Always \code{NULL} for \link{ParamDbl}, \link{ParamInt} and \link{ParamUty}.
Always \code{c(TRUE, FALSE)} for \link{ParamLgl}.}

\item{\code{nlevels}}{(\code{integer(1)} | \code{Inf})\cr
Number of categorical levels.
Always \code{Inf} for \link{ParamDbl} and \link{ParamUty}.
The number of integers in the range \verb{[lower, upper]}, or \code{Inf} if unbounded for \link{ParamInt}.
Always \code{2} for \link{ParamLgl}.}

\item{\code{is_bounded}}{(\code{logical(1)})\cr
Are the bounds finite?
Always \code{TRUE} for \link{ParamFct} and \link{ParamLgl}.
Always \code{FALSE} for \link{ParamUty}.}

\item{\code{storage_type}}{(\code{character(1)})\cr
Data type when values of this parameter are stored in a data table or sampled.
Always \code{"numeric"} for \link{ParamDbl}.
Always \code{"character"} for \link{ParamFct}.
Always \code{"integer"} for \link{ParamInt}.
Always \code{"logical"} for \link{ParamLgl}.
Always \code{"list"} for \link{ParamUty}.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{ParamInt$new()}}
\item \href{#method-clone}{\code{ParamInt$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Param" data-id="assert">}\href{../../paradox/html/Param.html#method-assert}{\code{paradox::Param$assert()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Param" data-id="check">}\href{../../paradox/html/Param.html#method-check}{\code{paradox::Param$check()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Param" data-id="format">}\href{../../paradox/html/Param.html#method-format}{\code{paradox::Param$format()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Param" data-id="print">}\href{../../paradox/html/Param.html#method-print}{\code{paradox::Param$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Param" data-id="qunif">}\href{../../paradox/html/Param.html#method-qunif}{\code{paradox::Param$qunif()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Param" data-id="rep">}\href{../../paradox/html/Param.html#method-rep}{\code{paradox::Param$rep()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Param" data-id="test">}\href{../../paradox/html/Param.html#method-test}{\code{paradox::Param$test()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParamInt$new(
  id,
  lower = -Inf,
  upper = Inf,
  special_vals = list(),
  default = NO_DEF,
  tags = character()
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id}}{(\code{character(1)})\cr
Identifier of the object.}

\item{\code{lower}}{(\code{numeric(1)})\cr
Lower bound, can be \code{-Inf}.}

\item{\code{upper}}{(\code{numeric(1)})\cr
Upper bound can be \code{+Inf}.}

\item{\code{special_vals}}{(\code{list()})\cr
Arbitrary special values this parameter is allowed to take, to make it
feasible. This allows extending the domain of the parameter. Note that
these values are only used in feasibility checks, neither in generating
designs nor sampling.}

\item{\code{default}}{(\code{any})\cr
Default value. Can be from the domain of the parameter or an element of
\code{special_vals}. Has value \link{NO_DEF} if no default exists. \code{NULL} can be a
valid default.}

\item{\code{tags}}{(\code{character()})\cr
Arbitrary tags to group and subset parameters. Some tags serve a special
purpose:\cr
\itemize{
\item \code{"required"} implies that the parameters has to be given when setting
\code{values} in \link{ParamSet}.
}}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParamInt$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
