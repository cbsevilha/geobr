context("read_state")

# skip tests because they take too much time
testthat::skip_on_cran()
# testthat::skip_on_travis()
# skip_if(Sys.getenv("TEST_ONE") != "")


test_that("read_state", {

  # read data
  testthat::expect_output( read_state() )
  testthat::expect_output( read_state(code_state=11, year=1991) )

  testthat::expect_output( read_state(code_state="AC", year=2010) )
  testthat::expect_output( read_state(code_state=11, year=2010) )
  testthat::expect_output( read_state(code_state="all") )




  test_code <- read_state(code_state=11, year=2010)

  # check sf object
  testthat::expect_true(is(test_code, "sf"))


  # check number of weighting areas
  testthat::expect_equal(nrow(test_code), 1)

})




# ERRORS
test_that("read_state", {

  # Wrong year and code
  testthat::expect_error(read_state(code_state=9999999, year=9999999))

  # Wrong code
  testthat::expect_error( read_state(code_state=NULL, year=1991) ) # EXception

   testthat::expect_error(read_state(code_state=9999999))
   testthat::expect_error(read_state(code_state=5201108312313213123123123))
   testthat::expect_error(read_state(code_state="AC_ABCD"))

  # Wrong year
   testthat::expect_error(read_state( year=9999999))

})
