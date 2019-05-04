#Binomial
context("check bin_choose")

test_that("bin_choose works", {
  expect_error(bin_choose(4, 5))
  expect_is(bin_choose(65, 64), numeric)
  expect_equal(bin_choose(2, 1), factorial(2) / (factorial(1) * factorial(2 - 1)))
})

context("check bin_probability")

test_that("bin_probability works", {
  expect_error(bin_probability(1, 1.5, 0.5))
  expect_error(bin_probability(-1, 1, 1))
  expect_error(bin_probability(1, 1, -0.6))

})

context("check bin_distribution")

test_that("bin_distribution works", {
  expect_error(bin_probability(-5, 0.5))
  expect_error(bin_probability(5, -0.5))
  expect_is(bin_probability(5, 0.5), c("bindis", "data.frame"))

})

context("check bin_cumulative")

test_that("bin_cumulative works", {
  expect_error(bin_probability(-5, 0.5))
  expect_error(bin_probability(5, -0.5))
  expect_is(bin_probability(5, 0.5), c("bincum", "data.frame"))

})

