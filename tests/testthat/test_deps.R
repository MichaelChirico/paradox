context("Dependencies")

test_that("basic example works", {
  ps = th_paramset_full()
  expect_false(ps$has_deps)
  ps$add_dep("th_param_int", on = "th_param_fct", cond_equal("a"))
  expect_true(ps$has_deps)
  x1 = list(th_param_int = 1)
  expect_string(ps$check(x1), fixed = "Condition for 'th_param_int'")
  x2 = list(th_param_int = 1, th_param_fct = "a")
  expect_true(ps$check(x2))
  x3 = list(th_param_int = 1, th_param_fct = "b")
  expect_string(ps$check(x3), fixed = "Condition for 'th_param_int'")
  x4 = list(th_param_fct = "a")
  expect_true(ps$check(x4))
  x5 = list(th_param_fct = "b")
  expect_true(ps$check(x5))
  x6 = list(th_param_dbl = 1.3)
  expect_true(ps$check(x6))

  # test printer, with 2 deps
  ps = th_paramset_full()
  ps$add_dep("th_param_int", on = "th_param_fct", cond_equal("a"))
  ps$add_dep("th_param_int", on = "th_param_lgl", cond_equal(TRUE))
  expect_output(print(ps),"th_param_fct,th_param_lgl")
})

test_that("nested deps work", {
  ps = th_paramset_full()
  ps$add_dep("th_param_int", on = "th_param_fct", cond_anyof(c("a", "b")))
  ps$add_dep("th_param_dbl", on = "th_param_lgl", cond_equal(TRUE))
  ps$add_dep("th_param_lgl", on = "th_param_fct", cond_equal("c"))

  x1 = list(th_param_int = 1)
  expect_string(ps$check(x1), fixed = "Condition for 'th_param_int'")
  x2 = list(th_param_int = 1, th_param_fct = "b")
  expect_true(ps$check(x2))
  x3 = list(th_param_int = 1, th_param_fct = "c")
  expect_string(ps$check(x3), fixed = "Condition for 'th_param_int'")
  x4 = list(th_param_fct = "a")
  expect_true(ps$check(x4))
  x5 = list(th_param_dbl = 1.3)
  expect_string(ps$check(x5), fixed = "Condition for 'th_param_dbl'")
  x6 = list(th_param_fct = "c", th_param_lgl = TRUE, th_param_dbl = 3)
  expect_true(ps$check(x6))
})


test_that("adding 2 sets with deps works", {
  ps1 = ParamSet$new(list(
    ParamFct$new("x1", values = c("a", "b")),
    ParamDbl$new("y1")
  ))
  ps1$add_dep("y1", on = "x1", cond_equal("a"))

  ps2 = ParamSet$new(list(
    ParamFct$new("x2", values = c("a", "b")),
    ParamDbl$new("y2")
  ))
  ps2$add_dep("y2", on = "x2", cond_equal("a"))

  ps1$add(ps2)
  expect_equal(ps1$length, 4L)
  expect_true(ps1$has_deps)
  expect_equal(length(ps1$deps), 2L)
  # do a few feasibility checks on larger set
  expect_true(ps1$test(list(x1 = "a", y1 = 1, x2 = "a", y1 = 1)))
  expect_true(ps1$test(list(x1 = "a", y1 = 1)))
  expect_false(ps1$test(list(x1 = "b", y1 = 1)))
  expect_true(ps1$test(list(x2 = "a", y2 = 1)))
  expect_false(ps1$test(list(x2 = "b", y2 = 1)))
})