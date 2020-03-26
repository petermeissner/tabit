#' tabit_1
#'
#' @param x the thing to be tabulated
#' @param sort should
#' @param digits the number of digits to round percentages to
#' @param ... further optional arguments passed through to methods
#' @param as_df if more than one vector has been tabulated at once, should
#'     the results be combined into a data.frame before returning
#' @param na_to_char transform NA values to "NA" chracter string or not, defaults to TRUE
#' @param pct add percentage columns
#' @param useNA how to handle NAs, defaults to "always" to always include NA as category
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
#' tabit_1(mtcars$cyl)
#' tabit_1(mtcars[, c("cyl", "am")])
#'
#'
tabit_1 <-
  function (x, sort = 1, digits = 2, ...) {
    UseMethod("tabit_1", x)
  }



#' tabit_1.data.frame
#'
#' @rdname tabit_1
#'
#' @export
#'
tabit_1.data.frame <-
  function (x, sort = 1, digits = 2, ..., as_df = TRUE ) {
    tabit_1(as.list(x), sort = sort, digits = digits, ..., as_df = as_df)
  }



#' tabit_1.list
#'
#' @rdname tabit_1
#'
#' @export
#'
tabit_1.list <-
  function (x, sort = 1, digits = 2, ..., as_df = TRUE) {
    x   <- as.data.frame(x,  stringsAsFactors = FALSE)
    tmp <- lapply(x, tabit_1, sort = sort, ...)

    nam <- names(x)
    for ( i in seq_along(nam) ){
      tmp[[i]]$variable <- nam[i]
    }

    if ( as_df == TRUE ){
      tmp            <-
        do.call(
          what = rbind,
          args =
            c(
              list(
                data.frame(
                  variable     = character(0),
                  value        = character(0),
                  count        = integer(0),
                  pct          = numeric(0),
                  pct_incl_na  = numeric(0),
                  stringsAsFactors = FALSE
                )
              ),
              tmp
            )
          )
      row.names(tmp) <- NULL
      return(tmp)
    } else {
      return(tmp)
    }
  }



#' tabit_1.default
#'
#' @rdname tabit_1
#'
#' @export
#'
tabit_1.default <-
  function (x, sort = 1, digits = 2, useNA = "always", pct = TRUE, na_to_char = TRUE, ...) {

    # execute tabulations
    tmp     <- table(x, useNA = useNA)
    tmp_nam <- names(tmp)
    tmp_val <- as.integer(tmp)

    # generate data.frame
    tmp <-
      data.frame(
        variable = rep("x", length(tmp_val)),
        value    = tmp_nam,
        count    = tmp_val,
        stringsAsFactors = FALSE
      )

    # add percentages
    if ( pct == TRUE ){
      sub_set <- !is.na(tmp_nam)
      tmp$pct[sub_set] <-
        round(tmp_val[sub_set] / sum(tmp_val[sub_set]) * 100, digits)

      tmp$pct_incl_na <-
        round(tmp_val / sum(tmp_val) * 100, digits)
    }

    # transform NA values to "NA" string
    if ( na_to_char == TRUE ){
      tmp$value[is.na(tmp$value)] <- "NA"
    }


    # return - ordered by count, in descending order, or not
    if ( sort < 0 ){
      return(tmp[order( tmp$count), ])
    } else if ( sort > 0 ){
      return(tmp[order(-tmp$count), ])
    } else {
      return(tmp)
    }
  }

