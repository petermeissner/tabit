#' tabit
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
#' tabit(mtcars$cyl)
#' tabit(mtcars[, c("cyl", "am")])
#'
#'
tabit <-
  function (x, sort = 1, digits = 2, ...) {
    UseMethod("tabit", x)
  }



#' tabit.data.frame
#'
#' @rdname tabit
#'
#' @export
#'
tabit.data.frame <-
  function (x, sort = 1, digits = 2, ..., as_df = TRUE ) {
    tabit(as.list(x), sort = sort, digits = digits, ..., as_df = as_df)
  }



#' tabit.list
#'
#' @rdname tabit
#'
#' @export
#'
tabit.list <-
  function (x, sort = 1, digits = 2, ..., as_df = TRUE) {
    x   <- as.data.frame(x)
    tmp <- lapply(x, ti_tab1, sort = sort, ...)

    if ( as_df == TRUE ){
      nam <- names(x)
      for ( i in seq_along(nam) ){
        tmp[[i]] <-
          cbind(
            data.frame(name = nam[i]),
            tmp[[i]]
          )
      }
      tmp            <- do.call(rbind, tmp)
      row.names(tmp) <- NULL
      return(tmp)
    } else {
      return(tmp)
    }
  }



#' tabit.default
#'
#' @rdname tabit
#'
#' @export
#'
tabit.default <-
  function (x, sort = 1, digits = 2, ...) {
    tmp     <- table(x, useNA = "always")
    tmp_val <- as.integer(tmp)
    tmp_nam <- names(tmp)

    tmp <-
      data.frame(
        value   = tmp_nam,
        count   = tmp_val,
        pct     =
          round(
            c(
              tmp_val[-length(tmp_val)] / sum(tmp_val[-length(tmp_val)]),
              NA
            ) * 100,
            digits
          ),
        pct_all = round(tmp_val / sum(tmp_val) * 100, digits)
      )

    # return - ordered by count in descending
    if ( sort < 0 ){
      return(tmp[order( tmp$count), ])
    } else if ( sort > 0 ){
      return(tmp[order(-tmp$count), ])
    } else {
      return(tmp)
    }
  }


#' @rdname tabit
#' @export
ti_tab1 <- tabit