#' @title Param Dependency
#'
#' @usage NULL
#' @format [R6::R6Class] object inheriting from [Param]
#'
#' @description
#' A dependency object for a parameter, connects a subordinate parameter with
#' its superordinate parent, and stores a condition on the parents value. In
#' simpler words: we can encode stuff like "foo is only valid, if bar='a'".
#' Constructor is mainly internally called, regular user-entry point is
#' `add_dep` of [ParamSet], the param set maintains an internal list of
#' Dependency objects.
#'
#' @section Construction:
#'
#' ```
#' d = Dependency$new(param, parent, cond)
#' ```
#'
#' * `param`             :: [Param] \cr
#'   The dependent param.
#' * `parent`            :: [Param] \cr
#'   The (categorical) param this param depends on.
#' * `cond`              :: [Condition] \cr
#'   Condition of the dependency.
#'
#' @name Dependency
#' @export
Dependency = R6Class("Dependency",
  public = list(
    param = NULL,
    parent = NULL,
    cond = NULL,

    initialize = function(param, parent, cond) {
      self$param = assert_param(param)
      self$parent = assert_param(parent)
      self$cond = assert_r6(cond, "Condition")
    },

    print = function(...) {
      catf("Dependency: For='%s', on='%s', cond='%s'", self$param$id, self$parent$id, self$cond$type)
    }
  )
)
