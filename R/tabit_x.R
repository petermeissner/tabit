#' tabit_x
#'
#' @param x the thing to be tabulated
#' @param sort should
#' @param digits the number of digits to round percentages to
#' @param ... further optional arguments passed through to methods
#' @param as_df if more than one vector has been tabulated at once, should
#'     the results be combined into a data.frame before returning
#'
#' @export
#'
#' @return Returns a data frame with columns
#'  \code{value} (the values tabulated by),
#'  \code{count} (the number of times a value occured),
#'  \code{pct} (the percentage that value occurred excluding NAs) and
#'  \code{pct_all} (the percentage that value occurred including NAs)
#'
#'
#'
#' @examples
#'
#' tabit_x(mtcars$cyl)
#' tabit_x(mtcars[, c("cyl", "am")])
#'
#'
tabit_x <-
  function (x, ..., sort = 1, digits = 2) {
    UseMethod("tabit_x", x)
  }



#' tabit_x.data.frame
#'
#' @rdname tabit_x
#'
#' @export
#'
tabit_x.data.frame <-
  function (x, ..., sort = 1, digits = 2, as_df = TRUE ) {
    aggregate(1:10, FUN = mean, by = list(rep(1,10)))
  }



#' tabit_x.default
#'
#' @rdname tabit_x
#'
#' @export
#'
tabit_x.default <-
  function (x, ..., sort = 1, digits = 2) {
    stop("tabit_x is not implemented for type: ", paste(class(x), collapse = ", "))
  }

