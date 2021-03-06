% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SamplerHierarchical.R
\name{SamplerHierarchical}
\alias{SamplerHierarchical}
\title{SamplerHierarchical Class}
\description{
Hierarchical sampling for arbitrary param sets with dependencies, where the user specifies 1D samplers per param.
Dependencies are topologically sorted, parameters are then sampled in topological order,
and if dependencies do not hold, values are set to \code{NA} in the resulting \code{data.table}.
}
\seealso{
Other Sampler: 
\code{\link{Sampler1DCateg}},
\code{\link{Sampler1DNormal}},
\code{\link{Sampler1DRfun}},
\code{\link{Sampler1DUnif}},
\code{\link{Sampler1D}},
\code{\link{SamplerJointIndep}},
\code{\link{SamplerUnif}},
\code{\link{Sampler}}
}
\concept{Sampler}
\section{Super class}{
\code{\link[paradox:Sampler]{paradox::Sampler}} -> \code{SamplerHierarchical}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{samplers}}{(\code{list()})\cr
List of \link{Sampler1D} objects that gives a Sampler for each \link{Param} in the \code{param_set}.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{SamplerHierarchical$new()}}
\item \href{#method-clone}{\code{SamplerHierarchical$clone()}}
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
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{SamplerHierarchical$new(param_set, samplers)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{param_set}}{(\link{ParamSet})\cr
Domain / support of the distribution we want to sample from.
ParamSet is cloned on construction.}

\item{\code{samplers}}{(\code{list()})\cr
List of \link{Sampler1D} objects that gives a Sampler for each \link{Param} in the \code{param_set}.}
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
\if{html}{\out{<div class="r">}}\preformatted{SamplerHierarchical$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
