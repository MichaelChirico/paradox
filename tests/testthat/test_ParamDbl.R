context("ParamDbl")

test_that("constructor works", {
  p = ParamDbl$new(id = "test", lower = 1, upper = 10)
  expect_equal(p$id, "test")
  expect_equal(p$lower, 1)
  expect_equal(p$upper, 10)

  # check that we can create param with Inf bounds
  p = ParamDbl$new(id = "test", lower = 1)
  expect_equal(p$lower, 1)
  expect_equal(p$upper, Inf)

  # check some invalid arg settings
  expect_error(ParamDbl$new(id = "x", lower = NULL), "not 'NULL'")
  expect_error(ParamDbl$new(id = "x", lower = 1, upper = 0), "lower <= upper")
  expect_error(ParamDbl$new(id = "x", lower = Inf, upper = 0), "lower <= upper")
})

test_that("allowing inf as feasible value works", {
  p = ParamDbl$new(id = "x", lower = 1, upper = 10)
  expect_true(p$test(1))
  expect_false(p$test(Inf))

  p = ParamDbl$new(id = "x", lower = 1, special_vals = list(Inf))
  expect_true(p$test(1))
  expect_true(p$test(Inf))
})


test_that("is_bounded works", {
  expect_true(ParamDbl$new(id = "x", lower = 1, upper = 10)$is_bounded)
  expect_false(ParamDbl$new(id = "x", lower = 1)$is_bounded)
  expect_false(ParamDbl$new(id = "x")$is_bounded)
})

test_that("qunif", {
  set.seed(8008135)
  n = 50000L
  testit = function(a, b) {

    # simulate from param, simulate directly from runif
    # then check that the estimated ecdfs from both distribs are nearly the same (L1 dist)
    p = ParamDbl$new("x", lower = a, upper = b)
    u = runif(n)
    v1 = p$qunif(u)
    v2 = runif(n, min = a, max = b)
    e1 = ecdf(v1)
    e2 = ecdf(v2)
    s = seq(a, b, by = 0.0001)
    d = abs(e1(s) - e2(s))
    expect_lte(max(d), 0.01)
  }
  testit(1, 12)
  testit(-2, 1)
})
