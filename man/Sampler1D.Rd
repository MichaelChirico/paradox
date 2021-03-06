% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Sampler1D.R
\name{Sampler1D}
\alias{Sampler1D}
\title{Sampler1D Class}
\description{
1D sampler, abstract base class for Sampler like \link{Sampler1DUnif}, \link{Sampler1DRfun}, \link{Sampler1DCateg} and \link{Sampler1DNormal}.
}
\seealso{
Other Sampler: 
\code{\link{Sampler1DCateg}},
\code{\link{Sampler1DNormal}},
\code{\link{Sampler1DRfun}},
\code{\link{Sampler1DUnif}},
\code{\link{SamplerHierarchical}},
\code{\link{SamplerJointIndep}},
\code{\link{SamplerUnif}},
\code{\link{Sampler}}
}
\concept{Sampler}
\section{Super class}{
\code{\link[paradox:Sampler]{paradox::Sampler}} -> \code{Sampler1D}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{param}}{(\link{Param})\cr
Returns the one Parameter that is sampled from.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Sampler1D$new()}}
\item \href{#method-clone}{\code{Sampler1D$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Sampler" data-id="format">}\href{../../paradox/html/Sampler.html#method-format}{\code{paradox::Sampler$format()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Sampler" data-id="print">}\href{../../paradox/html/Sampler.html#method-print}{\code{paradox::Sampler$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="Sampler" data-id="sample">}\href{../../paradox/html/Sampler.html#method-sample}{\code{paradox::Sampler$sample()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.

Note that this object is typically constructed via derived classes,
e.g., \link{Sampler1DUnif}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Sampler1D$new(param)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{param}}{(\link{Param})\cr
Domain / support of the distribution we want to sample from.}
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
\if{html}{\out{<div class="r">}}\preformatted{Sampler1D$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
