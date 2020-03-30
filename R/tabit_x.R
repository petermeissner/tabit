#' tabit_x
#'
#' Function for cross tabulation of variables within a data.frame or data.frame
#' like.
#'
#' The data.frame method will take all column value combination for cross
#' tabulation while the grouped_df method is explicitly for tibbles with group
#' information. For those only value combinations for the group columns are
#' relevant.
#'
#'
#' @param x the thing to be tabulated
#' @param sort should
#' @param digits the number of digits to round percentages to
#' @param useNA whether ro us NAs as value category or not, defaults to TRUE
#' @param ... further optional arguments passed through to methods
#'
#' @export
#'
#' @return Returns a data frame with columns
#'  zero, one or more columns with value combinations to be cross tabulated by,
#'  \code{.count} (the number of times a value occurred),
#'  \code{.pct} (the percentage that value occurred excluding NAs) and
#'  \code{.pct_incl_na} (the percentage that value occurred including NAs)
#'
#'
#' @import stats
#'
#' @examples
#'
#' tabit_x(mtcars)
#' tabit_x(mtcars[, c("cyl", "am")])
#'
#'
tabit_x <-
  function (x, ..., sort = 1, digits = 2, useNA = TRUE ) {
    UseMethod("tabit_x", x)
  }



#' tabit_x.data.frame
#'
#' @rdname tabit_x
#'
#' @export
#'
tabit_x.data.frame <-
  function (x, ..., sort = 1, digits = 2, useNA = TRUE ) {

    # process by parameter
    by <- x

    # short circuit edge cases
    if ( ncol(by) == 0 ){
      return(
        data.frame(.count = integer(0))
      )
    }

    if ( nrow(by) == 0 ){
      return(
        cbind(
          df    =  by[0,, drop = FALSE],
          .count = integer(0)
        )
      )
    }


    # process useNA parameter
    if ( useNA == TRUE ){
      by <-
        lapply(
          X   = by,
          FUN =
            function(by){
              by[is.na(by)] <- "$//NA//$"
              as.character(by)
            }
        )
    }

    # execute aggregation
    tmp <-
      stats::aggregate(rep(1, nrow(x)), FUN = sum, by = by)

    # post process aggregation
    names(tmp)[length(names(tmp))] <- ".count"
    tmp[tmp == "$//NA//$" ] <- NA


    # calculate percentages
    iffer <- complete.cases(tmp)
    tmp[iffer, ".pct"] <-
      round(
        x      = tmp[iffer, ".count"] / sum(tmp[iffer, ".count"]) * 100,
        digits = digits
      )

    tmp$.pct_incl_na <-
      round(
        x      = tmp[, ".count"] / sum(tmp[, ".count"]) * 100,
        digits = digits
      )



    # sort
    if ( sort > 0 ){
      tmp <- tmp[order(-tmp$.count), ]
    } else if ( sort < 0 ){
      tmp <- tmp[order(tmp$.count), ]
    }

    # return
    tmp
  }


#' tabit_x.grouped_df
#'
#' @rdname tabit_x
#'
#' @export
#'
tabit_x.grouped_df <-
  function (x, ..., sort = 1, digits = 2, useNA = TRUE ) {

    # process by parameter
    by_nam <- names(attributes(x)$groups)
    by <- x[by_nam[by_nam != ".rows"]]

    tabit_x.data.frame(by, ..., sort = sort, digits = digits, useNA = useNA)
  }


#' tabit_x.default
#'
#' @rdname tabit_x
#'
#' @export
#'
tabit_x.default <-
  function (x, ..., sort = 1, digits = 2, useNA = "always") {
    stop(
      "tabit_x is not implemented for type: ",
      paste(class(x), collapse = ", ")
    )
  }

