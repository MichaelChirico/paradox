% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ParamSetCollection.R
\name{ParamSetCollection}
\alias{ParamSetCollection}
\title{ParamSetCollection}
\description{
A collection of multiple \link{ParamSet} objects.
\itemize{
\item The collection is basically a light-weight wrapper / container around references to multiple sets.
\item In order to ensure unique param names, every param in the collection is referred to with
"<set_id>.<param_id>". Parameters from ParamSets with empty (i.e. \code{""}) \verb{$set_id} are referenced
directly. Multiple ParamSets with \verb{$set_id} \code{""} can be combined, but their parameter names
must be unique.
\item Operation \code{subset} is currently not allowed.
\item Operation \code{add} currently only works when adding complete sets not single params.
\item When you either ask for 'values' or set them, the operation is delegated to the individual,
contained param set references. The collection itself does not maintain a \code{values} state.
This also implies that if you directly change \code{values} in one of the referenced sets,
this change is reflected in the collection.
\item Dependencies: It is possible to currently handle dependencies
\itemize{
\item regarding parameters inside of the same set - in this case simply
add the dependency to the set, best before adding the set to the collection
\item across sets, where a param from one set depends on the state
of a param from another set - in this case add call \code{add_dep} on the collection.
}

If you call \code{deps} on the collection, you are returned a complete table of dependencies, from sets and across sets.
}
}
\section{Super class}{
\code{\link[paradox:ParamSet]{paradox::ParamSet}} -> \code{ParamSetCollection}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{params}}{(named \code{list()})\cr
List of \link{Param}, named with their respective ID.}

\item{\code{deps}}{(\code{\link[data.table:data.table]{data.table::data.table()}})\cr
Table has cols \code{id} (\code{character(1)}) and \code{on} (\code{character(1)}) and \code{cond} (\link{Condition}).
Lists all (direct) dependency parents of a param, through parameter IDs.
Internally created by a call to \code{add_dep}.
Settable, if you want to remove dependencies or perform other changes.}

\item{\code{values}}{(named \code{list()})\cr
Currently set / fixed parameter values.
Settable, and feasibility of values will be checked when you set them.
You do not have to set values for all parameters, but only for a subset.
When you set values, all previously set values will be unset / removed.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{ParamSetCollection$new()}}
\item \href{#method-add}{\code{ParamSetCollection$add()}}
\item \href{#method-remove_sets}{\code{ParamSetCollection$remove_sets()}}
\item \href{#method-subset}{\code{ParamSetCollection$subset()}}
\item \href{#method-clone}{\code{ParamSetCollection$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="add_dep">}\href{../../paradox/html/ParamSet.html#method-add_dep}{\code{paradox::ParamSet$add_dep()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="assert">}\href{../../paradox/html/ParamSet.html#method-assert}{\code{paradox::ParamSet$assert()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="assert_dt">}\href{../../paradox/html/ParamSet.html#method-assert_dt}{\code{paradox::ParamSet$assert_dt()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="check">}\href{../../paradox/html/ParamSet.html#method-check}{\code{paradox::ParamSet$check()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="check_dt">}\href{../../paradox/html/ParamSet.html#method-check_dt}{\code{paradox::ParamSet$check_dt()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="format">}\href{../../paradox/html/ParamSet.html#method-format}{\code{paradox::ParamSet$format()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="get_values">}\href{../../paradox/html/ParamSet.html#method-get_values}{\code{paradox::ParamSet$get_values()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="ids">}\href{../../paradox/html/ParamSet.html#method-ids}{\code{paradox::ParamSet$ids()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="print">}\href{../../paradox/html/ParamSet.html#method-print}{\code{paradox::ParamSet$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="test">}\href{../../paradox/html/ParamSet.html#method-test}{\code{paradox::ParamSet$test()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="paradox" data-topic="ParamSet" data-id="test_dt">}\href{../../paradox/html/ParamSet.html#method-test_dt}{\code{paradox::ParamSet$test_dt()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParamSetCollection$new(sets)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{sets}}{(\code{list()} of \link{ParamSet})\cr
Parameter objects are cloned.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-add"></a>}}
\if{latex}{\out{\hypertarget{method-add}{}}}
\subsection{Method \code{add()}}{
Adds a set to this collection.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParamSetCollection$add(p)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{p}}{(\link{ParamSet}).}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-remove_sets"></a>}}
\if{latex}{\out{\hypertarget{method-remove_sets}{}}}
\subsection{Method \code{remove_sets()}}{
Removes sets of given ids from collection.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParamSetCollection$remove_sets(ids)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{ids}}{(\code{character()}).}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-subset"></a>}}
\if{latex}{\out{\hypertarget{method-subset}{}}}
\subsection{Method \code{subset()}}{
Only included for consistency. Not allowed to perform on \link{ParamSetCollection}s.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParamSetCollection$subset(ids)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{ids}}{(\code{character()}).}
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
\if{html}{\out{<div class="r">}}\preformatted{ParamSetCollection$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
